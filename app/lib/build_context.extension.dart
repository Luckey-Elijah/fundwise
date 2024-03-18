import 'package:flutter/widgets.dart';

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
}
