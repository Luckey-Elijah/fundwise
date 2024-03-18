import 'package:app/dashboard.dart';
import 'package:app/login.dart';
import 'package:app/register_page.dart';
import 'package:app/splash_page.dart';
import 'package:app/theme/theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class FundwiseApp extends StatelessWidget {
  const FundwiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _appRoutes(),
      title: 'Fundwise',
      initialRoute: '/',
      themeMode: ThemeMode.light,
      theme: themeLight(FlexThemeData.light(scheme: FlexScheme.espresso)),
      darkTheme: themeDark(FlexThemeData.dark(scheme: FlexScheme.espresso)),
    );
  }
}

Map<String, WidgetBuilder> _appRoutes() {
  return {
    '/splash': (BuildContext context) => const SplashPage(),
    '/register': (BuildContext context) => const RegisterPage(),
    '/login': (BuildContext context) => const LoginPage(),
    '/': (BuildContext context) => const Dashboard(),
  };
}
