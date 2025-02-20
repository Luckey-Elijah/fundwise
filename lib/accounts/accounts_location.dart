import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';

class AccountsLocation extends Location {
  const AccountsLocation({this.id});

  final String? id;

  @override
  LocationPageBuilder? get pageBuilder {
    return (context) => DuckPage(
          child: _builder(context),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              _builder(context),
        );
  }

  Widget _builder(BuildContext context) => const Placeholder();

  @override
  String get path => id == null ? '/accounts' : '/accounts/$id';
}
