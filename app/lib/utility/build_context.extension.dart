import 'package:flutter/material.dart';

extension NavigationBuildContext on BuildContext {
  String? get routeName => ModalRoute.of(this)?.settings.name;

  NavigatorState get navigator => Navigator.of(this);

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      navigator.pushReplacementNamed(
        routeName,
        result: result,
        arguments: arguments,
      );

  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop<T>(result);
}

extension ThemeBuildContext on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
