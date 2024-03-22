import 'package:app/auth/auth_bloc.dart';
import 'package:app/auth/auth_navigator.dart';
import 'package:app/health/health_bloc.dart';
import 'package:app/health/health_notifier.dart';
import 'package:app/routes.dart' as app;
import 'package:app/theme_extension/theme.dart';
import 'package:app/utility/build_context.extension.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final pocketbase = PocketBase(
    'http://127.0.0.1:8090',
    authStore: AsyncAuthStore(
      save: (data) async => prefs.setString('auth', data),
      initial: prefs.getString('auth'),
    ),
  );

  return runApp(
    FundwiseApp(
      pocketbase: pocketbase,
      sharedPreferences: prefs,
    ),
  );
}

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
          BlocProvider(
            create: (c) =>
                AuthBloc(pocketbase: c.pocketbase)..add(InitializeEvent()),
          ),
          BlocProvider(
            create: (c) => OnlineBloc(pocketbase: c.pocketbase)..add(null),
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
              throw Exception('The [MaterialApp] has not routes.');
            }

            return MultiBlocListener(
              listeners: [
                AuthNavigator(navigatorState: navigatorKey.currentState),
                const HealthNotifier(),
              ],
              child: child,
            );
          },
        ),
      ),
    );
  }
}
