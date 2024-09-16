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

  final pb = PocketBase('', authStore: asyncAuthStore);
  final logging = LoggingRepository(pb: pb);
  final auth = AuthenticationRepository(loggingStore: logging, pb: pb);
  final url = UrlRepository(pb: pb, prefs: preferences);
  Bloc.observer = FundwiseBlocObserver(loggingStore: logging);

  final app = RepositoryProviderScope(
    url: url,
    logging: logging,
    licensing: licensing,
    pocketbase: pb,
    preferences: preferences,
    authentication: auth,
    child: BlocProviderScope(
      child: FundwiseApp(authentication: auth),
    ),
  );

  return runApp(app);
}
