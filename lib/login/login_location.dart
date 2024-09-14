import 'package:app/login/login_page.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';

class LoginLocation extends Location {
  @override
  LocationBuilder? get builder => _builder;

  Widget _builder(BuildContext context) => const LoginPage();

  @override
  String get path => '/login';
}
