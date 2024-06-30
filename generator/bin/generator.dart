import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:recase/recase.dart';

final parser = ArgParser()
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
    'verbose',
    abbr: 'v',
    defaultsTo: false,
    help: 'enable verbose logging',
  )
  ..addFlag(
    'help',
    abbr: 'h',
    help: 'show usage',
  );

final logger = Logger();

void main(List<String> args) async {
  final results = parser.parse(args);

  if (results.wasParsed('help')) {
    final title = green.wrap(styleBold.wrap('generator: pocketbase models'));
    logger.info(title);
    logger.info(parser.usage);
    return;
  }

  if (results.flag('verbose')) logger.level = Level.verbose;

  final schema = results.option('schema');
  if (schema != null) {
    var progress = logger.progress('parsing the schema $schema');
    var contents = jsonDecode(File(schema).readAsStringSync());
    progress.complete('$contents');
    return;
  }

  final url = results.option('url') ??
      logger.prompt(
        'pocketbase base url',
        defaultValue: 'http://127.0.0.1:8090',
      );

  final email =
      results.option('email') ?? logger.prompt('pocketbase admin email');

  final password = results.option('password') ??
      logger.prompt('pocketbase admin password', hidden: true);

  final pb = PocketBase(url);
  var progress = logger.progress('logging into pocketbase ${pb.baseUrl}');
  await pb.admins.authWithPassword(email, password);
  progress.complete();
  progress = logger.progress('collecting your schema');
  final collections = await pb.collections.getFullList();
  progress.complete();
  final models = generateDateModels(collections).join('\n');
  final output = results.option('output') ?? logger.prompt('path to output');
  progress = logger.progress('writing to $output');

  File(output)
    ..createSync(recursive: true)
    ..writeAsStringSync(models);

  progress.complete();
}

Iterable<String> generateDateModels(List<CollectionModel> collections) sync* {
  for (final collection in collections) {
    final type = switch (collection.type) {
      'base' => 'Base',
      'view' => '',
      'auth' => 'Auth',
      _ => throw 'unknown collection type: ${collection.type}',
    };
    yield 'class ${collection.name.pascalCase}$type {';

    yield '  ${collection.name.pascalCase}$type({';
    for (var column in collection.schema) {
      yield '    required this.${column.name.camelCase},';
    }
    yield '  });';

    for (var column in collection.schema) {
      yield '  final ${columnType(column.type)} ${column.name.camelCase};';
    }
    yield '}';
    yield '';
  }
}

String columnType(String type) {
  /* Plain, Rich, Number, Bool, Email, Url, DateTime, Select, File, Relation, JSON */
  return switch (type) {
    'text' => 'String',
    'rich' => 'String',
    'number' => 'num',
    'bool' => 'bool',
    'email' => 'String',
    'url' => 'Uri',
    'date_time' => 'DateTime',
    'select' => 'String',
    'file' => 'String',
    'relation' => 'String',
    _ => 'dynamic'
  };
}
