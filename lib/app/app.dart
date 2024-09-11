import 'package:app/app/animated_splash.dart';
import 'package:app/auth/authentication_navigation.dart';
import 'package:app/repository/auth_store.dart';
import 'package:app/router/router.dart';
import 'package:app/startup/startup_bloc.dart';
import 'package:app/startup/startup_state.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FundwiseApp extends StatefulWidget {
  const FundwiseApp({super.key});

  @override
  State<FundwiseApp> createState() => _FundwiseAppState();
}

class _FundwiseAppState extends State<FundwiseApp> {
  late final DuckRouter router =
      duckRouter(auth: context.read<AuthenticationStore>());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartUpBloc, StartUpState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: router,
          builder: (context, child) {
            if (state is LoadingStartUpState) return const AnimatedSplash();
            return AuthenticationNavigation(router: router, child: child);
          },
        );
      },
    );
  }
}
