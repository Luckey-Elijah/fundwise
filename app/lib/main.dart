import 'package:app/auth/auth_bloc.dart';
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

  final store = AsyncAuthStore(
    save: (data) async => prefs.setString('auth', data),
    initial: prefs.getString('auth'),
  );

  final pocketbase = PocketBase('http://127.0.0.1:8090', authStore: store);

  runApp(FundwiseApp(pocketbase: pocketbase));
}

class FundwiseApp extends StatefulWidget {
  const FundwiseApp({
    required this.pocketbase,
    super.key,
  });

  final PocketBase pocketbase;

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
