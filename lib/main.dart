import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  final licensing = LicensingRepository(rootBundle: rootBundle);
  final preferences = await SharedPreferences.getInstance();
  final asyncAuthStore = AsyncAuthStore(
    save: (data) => preferences.setString('pb_auth', data),
    initial: preferences.getString('pb_auth'),
  );

  final pocketbase = PocketBase('', authStore: asyncAuthStore);
  final logging = LoggingRepository(pb: pocketbase);
  final auth = AuthenticationRepository(loggingStore: logging, pb: pocketbase);
  final url = UrlRepository(pb: pocketbase, prefs: preferences);
  Bloc.observer = FundwiseBlocObserver(loggingStore: logging);

  final app = RepositoryProviderScope(
    url: url,
    logging: logging,
    licensing: licensing,
    pocketbase: pocketbase,
    preferences: preferences,
    authentication: auth,
    child: BlocProviderScope(
      child: FundwiseApp(authentication: auth),
    ),
  );

  return runApp(app);
}
