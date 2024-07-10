import 'package:app/login/login_cubit.dart';
import 'package:app/login/login_view.dart';
import 'package:app/repository/auth_store.dart';
import 'package:app/repository/pocketbase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            authRepository: authentication$,
            prefs: preferences$,
          )..initialize(),
        ),
      ],
      child: const LoginView(),
    );
  }
}
