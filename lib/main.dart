import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/auth/auth_bloc.dart';
import 'package:app/repository/auth_store.dart';
import 'package:app/repository/licensing_store.dart';
import 'package:app/repository/logging_store.dart';
import 'package:app/repository/pocketbase.dart';
import 'package:app/repository/url_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  LicenseRegistry.addLicense(licensing$.fontLicenses);
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

  try {
    final (url, _) = await (url$.getUrl(), authentication$.refresh()).wait;

    if (url == null) authentication$.signOut();
  } catch (e, s) {
    unawaited(logging$.logException(exception: e, stackTrace: s));
  }

  return runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(authentication$)
        ..add(InitializeAuthenticationEvent()),
      child: const FundwiseApp(),
    ),
  );
}
