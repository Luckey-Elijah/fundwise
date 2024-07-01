import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:recase/recase.dart';

var parser = ArgParser()
  ..addOption('output', abbr: 'o', help: 'path place generated files')
  ..addOption(
    'url',
    help: 'pocketbase base url',
    defaultsTo: 'http://127.0.0.1:8090',
  )
  ..addOption(
    'email',
    abbr: 'u',
    help: 'pocketbase admin user login email',
  )
  ..addOption(
    'schema',
    abbr: 's',
    help: 'use a pocketbase schema to generate the models',
  )
  ..addOption(
    'password',
    abbr: 'p',
    help: 'pocketbase admin user login password',
  )
  ..addFlag(
    'help',
    abbr: 'h',
    help: 'show usage',
  );

enum Foo {
  bar;

  static Foo? tryParse(String maybe) {
    for (var value in Foo.values) {
      if (value.name == maybe) return value;
    }
    return null;
  }
}

void main(List<String> args) async {
  var results = parser.parse(args);

  if (results.wasParsed('help')) {
    stdout.writeln('generator: pocketbase models');
    stdout.writeln(parser.usage);
    return;
  }
  var logger = Logger();
  List<CollectionModel> collections;
  var schema = results.option('schema');
  if (schema != null) {
    var contents = jsonDecode(File(schema).readAsStringSync()) as List;

    collections = contents
        .cast<Map<String, dynamic>>()
        .map(CollectionModel.fromJson)
        .toList();
  } else {
    var url = results.option('url') ??
        logger.prompt(
          'pocketbase base url:',
          defaultValue: 'http://127.0.0.1:8090',
        );

    var pb = PocketBase(url);
    var email =
        results.option('email') ?? logger.prompt('pocketbase admin email:');

    var password = results.option('password') ??
        logger.prompt('pocketbase admin password:', hidden: true);

    await pb.admins.authWithPassword(email, password);
    collections = await pb.collections.getFullList();
  }

  var emitter = DartEmitter();
  var formatter = DartFormatter();
  var buff = StringBuffer();

  for (var collection in collections) {
    for (var column in collection.schema) {
      if (column.type == 'select') {
        var enu = buildEnumFromColumnSelect(column).accept(emitter);
        buff.writeln(formatter.format('$enu'));
      }
    }

    var model = buildClassFromCollectionModel(collection).accept(emitter);
    buff.write(formatter.format('$model'));
  }

  var output = results.option('output') ?? logger.prompt('path to output');

  var file = File(output)
    ..createSync(recursive: true)
    ..writeAsStringSync('$buff');

  stdout.writeln('wrote generated files to ${file.path}');
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
