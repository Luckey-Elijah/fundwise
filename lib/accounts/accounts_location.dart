import 'package:app/router/custom_pages.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';

class AccountsLocation extends Location {
  const AccountsLocation({this.id});

  final String? id;

  @override
  LocationPageBuilder? get pageBuilder {
    return (c) => NoTransitionPage(name: path, child: _builder(c));
  }

  Widget _builder(BuildContext context) => const Placeholder();

  @override
  String get path => id == null ? '/accounts' : '/accounts/$id';
}
