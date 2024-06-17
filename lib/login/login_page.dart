import 'package:app/components/context_extension.dart';
import 'package:app/login/login_cubit.dart';
import 'package:app/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(pocketBase: context.pb),
      child: const LoginView(),
    );
  }
}
