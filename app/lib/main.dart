import 'package:app/dashboard/dashboard.dart';
import 'package:app/login/login.dart';
import 'package:app/not_found/not_found_page.dart';
import 'package:app/register/register_page.dart';
import 'package:app/splash/splash_page.dart';
import 'package:app/theme_extension/theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FundwiseApp());

class FundwiseApp extends StatelessWidget {
  const FundwiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    const scheme = FlexScheme.espresso;
    return MaterialApp(
      title: 'Fundwise',
      routes: ApplicationRoutes.routes(),
      initialRoute: ApplicationRoutes.initialRoute,
      themeMode: ThemeMode.light,
      theme: theme(FlexThemeData.light(scheme: scheme)),
      darkTheme: theme(FlexThemeData.dark(scheme: scheme)),
    );
  }
}

enum ApplicationRoutes {
  splash('/splash'),
  register('/register'),
  login('/login'),
  info('/info'),
  notFound('/404'),
  dashboard('/'),
  ;

  const ApplicationRoutes(this.path);

  final String path;

  static String get initialRoute => ApplicationRoutes.notFound.path;

  static Map<String, WidgetBuilder> routes() => {
        for (final route in ApplicationRoutes.values)
          route.path: switch (route) {
            ApplicationRoutes.splash => (_) => const SplashPage(),
            ApplicationRoutes.register => (_) => const RegisterPage(),
            ApplicationRoutes.login => (_) => const LoginPage(),
            ApplicationRoutes.dashboard => (_) => const Dashboard(),
            ApplicationRoutes.info => (_) => const Scaffold(),
            ApplicationRoutes.notFound => (_) => const NotFoundPage(),
          },
      };
}
