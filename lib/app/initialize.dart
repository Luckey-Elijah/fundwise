import 'dart:async';

import 'package:app/app/observer.dart';
import 'package:app/repository/auth_store.dart';
import 'package:app/repository/licensing_store.dart';
import 'package:app/repository/logging_store.dart';
import 'package:app/repository/url_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> initialize({
  required UrlStore url,
  required LoggingStore logging,
  required LicensingStore licensing,
  required AuthenticationStore auth,
}) async {
  LicenseRegistry.addLicense(licensing.fontLicenses);
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    unawaited(
      logging.logException(
        exception: details.exception,
        stackTrace: details.stack,
      ),
    );
  };

  Bloc.observer = FundwiseBlocObserver(loggingStore: logging);

  try {
    final (u, _) = await (url.getUrl(), auth.refresh()).wait;
    if (u == null) auth.signOut();
  } catch (e, s) {
    unawaited(logging.logException(exception: e, stackTrace: s));
  }
}
