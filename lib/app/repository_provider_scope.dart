import 'package:app/repository/repository.dart';
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
  final UrlRepository url;
  final LoggingRepository logging;
  final PocketBase pocketbase;
  final LicensingRepository licensing;
  final SharedPreferences preferences;
  final AuthenticationRepository authentication;

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
        RepositoryProvider(create: (_) => DateRepository()),
        RepositoryProvider(create: (_) => UserRepository(pb: pocketbase)),
        RepositoryProvider(create: (_) => BudgetRepository(pb: pocketbase)),
        RepositoryProvider(create: (_) => HealthRepository(pb: pocketbase)),
        RepositoryProvider(create: (_) => DateFormatRepository(pb: pocketbase)),
      ],
      child: child,
    );
  }
}
