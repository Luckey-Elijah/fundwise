import 'dart:developer';

import 'package:app/auth/auth_bloc.dart';
import 'package:app/repository/auth_store.dart';
import 'package:app/router/router.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FundwiseApp extends StatefulWidget {
  const FundwiseApp({super.key});

  @override
  State<FundwiseApp> createState() => _FundwiseAppState();
}

class _FundwiseAppState extends State<FundwiseApp> {
  late final _router = duckRouter(auth: context.read<AuthenticationStore>());

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listenWhen: (prev, next) {
            final auth =
                prev is! AuthenticatedState && next is AuthenticatedState;
            final notAuth =
                prev is! NotAuthenticatedState && next is NotAuthenticatedState;
            return auth || notAuth;
          },
          listener: (context, state) {
            log('$state');
            final router = DuckRouter.maybeOf(context);
            if (router == null) return;
            if (state is AuthenticatedState) {
              router.navigate(
                to: HomeLocation(),
                root: true,
                clearStack: true,
                replace: true,
              );
            }
            if (state is NotAuthenticatedState) {
              router.navigate(
                to: LoginLocation(),
                root: true,
                clearStack: true,
                replace: true,
              );
            }
          },
          child: child,
        );
      },
    );
  }
}
