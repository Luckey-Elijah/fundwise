import 'package:app/login/login_bloc.dart';
import 'package:app/login/login_view.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        auth: context.read<AuthenticationRepository>(),
        prefs: context.read<SharedPreferences>(),
      )..add(InitializeLoginEvent()),
      child: const LoginView(),
    );
  }
}
