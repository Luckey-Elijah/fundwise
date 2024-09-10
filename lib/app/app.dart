import 'dart:developer';

import 'package:app/auth/auth_bloc.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FundwiseApp extends StatefulWidget {
  const FundwiseApp({super.key});

  @override
  State<FundwiseApp> createState() => _FundwiseAppState();
}

class _FundwiseAppState extends State<FundwiseApp> {
  late final _router = duckRouter;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (prev, next) {
        final auth = prev is! AuthenticatedState && next is AuthenticatedState;
        final notAuth =
            prev is! NotAuthenticatedState && next is NotAuthenticatedState;
        return auth || notAuth;
      },
      listener: (context, state) {
        log('$state');
        if (state is AuthenticatedState) {
          _router.navigate(
            to: HomeLocation(),
            root: true,
            clearStack: true,
            replace: true,
          );
        } else if (state is NotAuthenticatedState) {
          _router.navigate(
            to: LoginLocation(),
            root: true,
            clearStack: true,
            replace: true,
          );
        } else if (state is UnknownAuthenticatedState) {
          _router.navigate(
            to: SplashLocation(),
            root: true,
            clearStack: true,
            replace: true,
          );
        }
      },
      child: MaterialApp.router(
        routerConfig: _router,
      ),
    );
  }
}
