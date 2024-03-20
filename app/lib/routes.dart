import 'package:app/dashboard/dashboard.dart';
import 'package:app/login/login.dart';
import 'package:app/not_found/not_found_page.dart';
import 'package:app/register/register_page.dart';
import 'package:app/splash/splash_page.dart';
import 'package:flutter/material.dart';

enum Routes {
  splash('/splash'),
  register('/register'),
  login('/login'),
  // info('/info'),
  notFound('/404'),
  dashboard('/'),
  ;

  const Routes(this.path);

  final String path;

  static String get initialRoute => Routes.dashboard.path;

  static Map<String, WidgetBuilder> routes() => {
        for (final route in Routes.values)
          route.path: switch (route) {
            Routes.splash => (_) => const SplashPage(),
            Routes.register => (_) => const RegisterPage(),
            Routes.login => (_) => const LoginPage(),
            Routes.dashboard => (_) => const Dashboard(),
            // Routes.info => (_) => const Scaffold(),
            Routes.notFound => (_) => const NotFoundPage(),
          },
      };
}
