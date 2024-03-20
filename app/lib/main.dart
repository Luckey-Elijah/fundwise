import 'package:app/auth/auth_bloc.dart';
import 'package:app/routes.dart' as app;
import 'package:app/theme_extension/theme.dart';
import 'package:app/utility/build_context.extension.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

void main() {
  runApp(const FundwiseApp());
}

class FundwiseApp extends StatefulWidget {
  const FundwiseApp({super.key});

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
        RepositoryProvider(
          create: (_) => PocketBase('http://127.0.0.1:8090'),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (c) =>
                AuthBloc(pocketbase: c.pocketbase)..add(InitializeEvent()),
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
            return BlocListener<AuthBloc, AuthState>(
              listenWhen: (prev, next) => prev != next,
              listener: (context, state) =>
                  navigatorKey.currentState?.pushReplacementNamed(
                state == AuthState.authenticated
                    ? app.Routes.dashboard.path
                    : app.Routes.initialRoute,
              ),
              child: child,
            );
          },
        ),
      ),
    );
  }
}
