import 'package:app/repository/auth_store.dart';
import 'package:app/repository/budget_store.dart';
import 'package:app/repository/date_format_store.dart';
import 'package:app/repository/health_store.dart';
import 'package:app/repository/licensing_store.dart';
import 'package:app/repository/logging_store.dart';
import 'package:app/repository/url_store.dart';
import 'package:app/repository/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RepositoryProviderScope extends StatelessWidget {
  const RepositoryProviderScope({
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
        RepositoryProvider.value(value: licensing),
        RepositoryProvider.value(value: pocketbase),
        RepositoryProvider.value(value: preferences),
        RepositoryProvider.value(value: authentication),
        RepositoryProvider(create: (_) => UserStore(pb: pocketbase)),
        RepositoryProvider(create: (_) => BudgetStore(pb: pocketbase)),
        RepositoryProvider(create: (_) => HealthStore(pb: pocketbase)),
        RepositoryProvider(create: (_) => DateFormatStore(pb: pocketbase)),
      ],
      child: child,
    );
  }
}
