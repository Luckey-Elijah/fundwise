import 'package:app/routes.dart' as app;
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
      routes: app.Routes.routes(),
      initialRoute: app.Routes.initialRoute,
      themeMode: ThemeMode.light,
      theme: theme(FlexThemeData.light(scheme: scheme)),
      darkTheme: theme(FlexThemeData.dark(scheme: scheme)),
    );
  }
}
