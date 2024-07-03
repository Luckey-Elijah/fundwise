import 'dart:convert';
import 'dart:io';

import 'package:args/src/arg_results.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:generator/logger.dart';
import 'package:generator/parser.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:recase/recase.dart';

void main(List<String> args) async {
  var results = parser.parse(args);

  if (results.help) {
    logger.info('generator: pocketbase models');
    logger.info(parser.usage);
    return;
  }

  List<CollectionModel> collections;

  if (results.schema case String schema) {
    collections = collectionsFromSchema(schema);
  } else {
    collections = await collectionFromServer(results);
  }

  final emitter = DartEmitter();
  final formatter = DartFormatter();
  final buff = StringBuffer();

  for (final collection in collections) {
    for (final column in collection.schema) {
      if (column.type == 'select') {
        final enu = buildEnumFromColumnSelect(column).accept(emitter);
        buff.writeln(formatter.format('$enu'));
      }
    }

    final model = buildClassFromCollectionModel(collection).accept(emitter);
    buff.write(formatter.format('$model'));
  }

  final output = results.option('output') ?? logger.prompt('path to output');

  final file = File(output)
    ..createSync(recursive: true)
    ..writeAsStringSync('$buff');

  stdout.writeln('wrote generated files to ${file.path}');
}

Future<List<CollectionModel>> collectionFromServer(ArgResults results) async {
  final prompt = logger.prompt;
  final defaultUrl = 'http://127.0.0.1:8090';
  final url = results.url ?? prompt('url:', defaultValue: defaultUrl);
  final email = results.email ?? prompt('email:');
  final password = results.password ?? prompt('password:', hidden: true);

  final pb = PocketBase(url);
  await pb.admins.authWithPassword(email, password);
  final collections = await pb.collections.getFullList();
  return collections;
}

List<CollectionModel> collectionsFromSchema(String schema) {
  final progress = logger.progress('reading scheme: $schema');
  final contents = jsonDecode(File(schema).readAsStringSync()) as List;

  progress.update('parsing schema');

  final collections = contents
      .cast<Map<String, dynamic>>()
      .map(CollectionModel.fromJson)
      .toList();

  progress.complete();

  return collections;
}

Enum buildEnumFromColumnSelect(SchemaField column) {
  return Enum(
    (builder) => builder
      ..name = column.name.pascalCase
      ..methods = ListBuilder([
        Method(
          (builder) => builder
            ..name = 'tryParse'
            ..static = true
            ..requiredParameters = ListBuilder([
              Parameter(
                (builder) => builder
                  ..type = refer('String')
                  ..name = 'maybe',
              ),
            ])
            ..returns = refer('${column.name.pascalCase}?')
            ..body = Code(
              '''
              for (var value in ${column.name.pascalCase}.values) {
                if (value.name == maybe) return value;
              }
              return null;
              ''',
            ),
        ),
      ])
      ..values = ListBuilder(
        [
          for (var value in column.options['values'])
            EnumValue((builder) => builder..name = '$value'.camelCase)
        ],
      ),
  );
}

Class buildClassFromCollectionModel(CollectionModel collection) {
  var type = switch (collection.type) {
    'base' => 'Base',
    'view' => '',
    'auth' => 'Auth',
    _ => throw 'unknown collection type: ${collection.type}',
  };

  return Class(
    (builder) => builder
      ..name = '${collection.name.pascalCase}$type'
      ..fields = ListBuilder(
        [
          for (var column in collection.schema)
            Field((builder) => builder
              ..name = column.name.camelCase
              ..modifier = FieldModifier.final$
              ..type = columnToDartType(column))
        ],
      )
      ..constructors = ListBuilder(
        [
          Constructor(
            (builder) => builder
              ..constant = true
              ..optionalParameters = ListBuilder(
                [
                  for (var column in collection.schema)
                    Parameter(
                      (builder) => builder
                        ..name = column.name.camelCase
                        ..named = true
                        ..toThis = true
                        ..required = true,
                    )
                ],
              ),
          )
        ],
      ),
  );
}

TypeReference columnToDartType(SchemaField column) {
  var symbol = switch (column.type) {
    'file' || 'text' || 'email' || 'relation' => 'String',
    'bool' => 'bool',
    'number' => 'int',
    'select' => column.name.pascalCase,
    'json' => 'Map<String, dynamic>',
    _ => 'Object',
  };

  return TypeReference(
    (builder) => builder
      ..isNullable = column.required
      ..symbol = symbol,
  );
}
