import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/repository/auth.repo.dart';
import 'package:app/repository/budget.repo.dart';
import 'package:app/repository/date_format.repo.dart';
import 'package:app/repository/health.repo.dart';
import 'package:app/repository/logging.repo.dart';
import 'package:app/repository/url.repo.dart';
import 'package:app/repository/user.repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final prefs = await SharedPreferences.getInstance();

  final store = AsyncAuthStore(
    save: (data) async => prefs.setString('pb_auth', data),
    initial: prefs.getString('pb_auth'),
  );

  final pb = PocketBase('', authStore: store);

  final logRepo = LoggingRepository(pb: pb);

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    unawaited(
      logRepo.logException(
        exception: details.exception,
        stackTrace: details.stack,
      ),
    );
  };

  final urlRepo = UrlRepository(pb: pb, prefs: prefs);
  final authRepo = AuthRepository(pb: pb);
  final url = await urlRepo.getUrl();

  if (url == null) {
    authRepo.signOut();
  }

  return runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: prefs),
        RepositoryProvider.value(value: urlRepo),
        RepositoryProvider.value(value: authRepo),
        RepositoryProvider(
          create: (_) => DateTime.now().copyWith(
            hour: 0,
            minute: 0,
            second: 0,
            millisecond: 0,
            microsecond: 0,
          ),
        ),
        RepositoryProvider(create: (_) => DateFormatRepository(pb: pb)),
        RepositoryProvider(create: (_) => BudgetRepository(pb: pb)),
        RepositoryProvider(create: (_) => HealthRepository(pb: pb)),
        RepositoryProvider(create: (_) => UserRepository(pb: pb)),
      ],
      child: const FundwiseApp(),
    ),
  );
}
