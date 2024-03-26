import 'package:app/auth/auth_bloc.dart';
import 'package:app/auth/auth_navigator.dart';
import 'package:app/health/health.dart' as health;
import 'package:app/routes.dart' as app;
import 'package:app/theme_extension/theme.dart';
import 'package:app/utility/build_context.extension.dart';
import 'package:app/utility/exception.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

export './observer.dart';

class FundwiseApp extends StatefulWidget {
  const FundwiseApp({
    required this.pocketbase,
    required this.sharedPreferences,
    super.key,
  });

  final PocketBase pocketbase;
  final SharedPreferences sharedPreferences;

  @override
  State<FundwiseApp> createState() => _FundwiseAppState();
}

class _FundwiseAppState extends State<FundwiseApp> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    const scheme = FlexScheme.espresso;
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: widget.pocketbase),
        RepositoryProvider.value(value: widget.sharedPreferences),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (c) => AuthBloc(
              pocketbase: c.pocketbase,
            )..add(InitializeEvent()),
          ),
          BlocProvider<health.HealthBloc>(
            create: (c) => health.HealthBloc(
              pocketbase: c.pocketbase,
            )..add(const health.HealthEvent()),
          ),
        ],
        child: MaterialApp(
          title: 'Fundwise',
          routes: app.Routes.routes(),
          initialRoute: app.Routes.initialRoute,
          navigatorKey: navigatorKey,
          themeMode: ThemeMode.light,
          theme: theme(FlexThemeData.light(scheme: scheme)),
          darkTheme: theme(FlexThemeData.dark(scheme: scheme)),
          builder: (_, child) {
            if (child == null) {
              throw const FundwiseException(
                message: 'The [MaterialApp] has no routes.',
              );
            }
            return MultiBlocListener(
              listeners: [
                AuthNavigator(navigatorState: navigatorKey.currentState),
                const health.HealthNotifier(),
              ],
              child: child,
            );
          },
        ),
      ),
    );
  }
}
