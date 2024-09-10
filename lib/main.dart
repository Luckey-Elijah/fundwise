import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/app/observer.dart';
import 'package:app/auth/auth_bloc.dart';
import 'package:app/repository/auth_store.dart';
import 'package:app/repository/budget_store.dart';
import 'package:app/repository/date_format_store.dart';
import 'package:app/repository/health_store.dart';
import 'package:app/repository/licensing_store.dart';
import 'package:app/repository/logging_store.dart';
import 'package:app/repository/url_store.dart';
import 'package:app/repository/user_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final licensing = LicensingStore(rootBundle: rootBundle);
  LicenseRegistry.addLicense(licensing.fontLicenses);
  final preferences = await SharedPreferences.getInstance();
  final pocketbase = PocketBase(
    '',
    authStore: AsyncAuthStore(
      save: (data) async => preferences.setString('pb_auth', data),
      initial: preferences.getString('pb_auth'),
    ),
  );
  final logging = LoggingStore(pb: pocketbase);
  Bloc.observer = FundwiseBlocObserver(loggingStore: logging);

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    unawaited(
      logging.logException(
        exception: details.exception,
        stackTrace: details.stack,
      ),
    );
  };

  final authentication =
      AuthenticationStore(loggingStore: logging, pb: pocketbase);

  final urlStore = UrlStore(pb: pocketbase, prefs: preferences);

  try {
    final (url, _) = await (urlStore.getUrl(), authentication.refresh()).wait;

    if (url == null) authentication.signOut();
  } catch (e, s) {
    unawaited(logging.logException(exception: e, stackTrace: s));
  }

  return runApp(
    ProviderScope(
      url: urlStore,
      logging: logging,
      licensing: licensing,
      pocketbase: pocketbase,
      preferences: preferences,
      authentication: authentication,
      child: BlocProvider(
        create: (context) =>
            AuthenticationBloc(context.read<AuthenticationStore>())
              ..add(InitializeAuthenticationEvent()),
        child: const FundwiseApp(),
      ),
    ),
  );
}

class ProviderScope extends StatelessWidget {
  const ProviderScope({
    required this.url,
    required this.child,
    required this.logging,
    required this.licensing,
    required this.pocketbase,
    required this.preferences,
    required this.authentication,
    super.key,
  });

  final Widget child;
  final UrlStore url;
  final LoggingStore logging;
  final PocketBase pocketbase;
  final LicensingStore licensing;
  final SharedPreferences preferences;
  final AuthenticationStore authentication;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: url),
        RepositoryProvider.value(value: logging),
        RepositoryProvider.value(value: pocketbase),
        RepositoryProvider.value(value: preferences),
        RepositoryProvider.value(value: authentication),
        RepositoryProvider.value(value: licensing),
        RepositoryProvider(
          create: (_) => BudgetStore(pb: pocketbase),
        ),
        RepositoryProvider(
          create: (_) => HealthStore(pb: pocketbase),
        ),
        RepositoryProvider(
          create: (_) => DateFormatStore(pb: pocketbase),
        ),
        RepositoryProvider(create: (_) => UserStore(pb: pocketbase)),
      ],
      child: child,
    );
  }
}
