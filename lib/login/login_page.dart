import 'package:app/login/login_cubit.dart';
import 'package:app/login/login_view.dart';
import 'package:app/repository/auth.repo.dart';
import 'package:app/repository/health.repo.dart';
import 'package:app/repository/url.repo.dart';
import 'package:app/server/server_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            authRepository: context.read<AuthRepository>(),
            prefs: context.read<SharedPreferences>(),
          )..initialize(),
        ),
        BlocProvider(
          create: (context) => ServerCubit(
            healthRepository: context.read<HealthRepository>(),
            urlRepository: context.read<UrlRepository>(),
          )..initialize(),
        ),
      ],
      child: const LoginView(),
    );
  }
}
