import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/repository/auth_store.dart';
import 'package:app/repository/logging_store.dart';
import 'package:app/repository/pocketbase.dart';
import 'package:app/repository/url_store.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  preferences$ = await SharedPreferences.getInstance();
  logging$ = LoggingStore(pb: pocketbase$);

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    unawaited(
      logging$.logException(
        exception: details.exception,
        stackTrace: details.stack,
      ),
    );
  };

  final url = await url$.getUrl();
  if (url == null) authentication$.signOut();

  return runApp(const FundwiseApp());
}
