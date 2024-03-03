import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:fundwise_database/database.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  return serve(handler.use(_databaseProvider()), ip, port);
}

final _fundwiseDatabase = FundwiseDatabase();

Middleware _databaseProvider() =>
    provider<FundwiseDatabase>((context) => _fundwiseDatabase);
