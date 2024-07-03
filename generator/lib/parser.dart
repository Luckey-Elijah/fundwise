import 'package:args/args.dart';

final parser = ArgParser()
  ..addOption('output', abbr: 'o', help: 'path place generated files')
  ..addOption('url', help: 'base url')
  ..addOption('email', help: 'admin user login email')
  ..addOption('schema', help: 'use a schema to generate the models')
  ..addOption('password', help: 'admin user login password')
  ..addFlag('help', abbr: 'h', help: 'show usage');

extension GeneratorArgResults on ArgResults {
  bool get help => wasParsed('help');
  String? get output => option('output');
  String? get url => option('url');
  String? get email => option('email');
  String? get schema => option('schema');
  String? get password => option('password');
}
