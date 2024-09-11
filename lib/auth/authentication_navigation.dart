import 'package:app/auth/auth_bloc.dart';
import 'package:app/router/router.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationNavigation extends StatelessWidget {
  const AuthenticationNavigation({
    required this.child,
    required this.router,
    super.key,
  });

  final Widget? child;
  final DuckRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (prev, next) =>
          prev is! AuthenticatedState && next is AuthenticatedState ||
          prev is! NotAuthenticatedState && next is NotAuthenticatedState,
      listener: (context, state) {
        if (state is AuthenticatedState) {
          router.navigate(
            to: HomeLocation(),
            clearStack: true,
            replace: true,
          );
        }
        if (state is NotAuthenticatedState) {
          router.navigate(
            to: LoginLocation(),
            clearStack: true,
            replace: true,
          );
        }
      },
      child: child,
    );
  }
}
