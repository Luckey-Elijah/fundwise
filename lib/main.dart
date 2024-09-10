import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/app/bloc_provider_scope.dart';
import 'package:app/app/initialize.dart';
import 'package:app/app/repository_provider_scope.dart';
import 'package:app/repository/auth_store.dart';
import 'package:app/repository/licensing_store.dart';
import 'package:app/repository/logging_store.dart';
import 'package:app/repository/url_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final licensing = LicensingStore(rootBundle: rootBundle);
  final preferences = await SharedPreferences.getInstance();
  final asyncAuthStore = AsyncAuthStore(
    save: (data) => preferences.setString('pb_auth', data),
    initial: preferences.getString('pb_auth'),
  );
  final pocketbase = PocketBase('', authStore: asyncAuthStore);
  final logging = LoggingStore(pb: pocketbase);
  final auth = AuthenticationStore(loggingStore: logging, pb: pocketbase);
  final url = UrlStore(pb: pocketbase, prefs: preferences);

  await initialize(
    url: url,
    auth: auth,
    logging: logging,
    licensing: licensing,
  );

  return runApp(
    RepositoryProviderScope(
      url: url,
      logging: logging,
      licensing: licensing,
      pocketbase: pocketbase,
      preferences: preferences,
      authentication: auth,
      child: const BlocProviderScope(child: FundwiseApp()),
    ),
  );
}
