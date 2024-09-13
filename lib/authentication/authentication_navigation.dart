import 'dart:developer';

import 'package:app/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationNavigation extends StatelessWidget {
  const AuthenticationNavigation({
    required this.child,
    required this.onAuthenticated,
    required this.onNotAuthenticated,
    super.key,
  });

  final Widget? child;
  final VoidCallback onAuthenticated;
  final VoidCallback onNotAuthenticated;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (prev, next) {
        log('${prev.runtimeType} -> ${next.runtimeType}');
        return prev is! AuthenticatedState && next is AuthenticatedState ||
            prev is! NotAuthenticatedState && next is NotAuthenticatedState;
      },
      listener: (context, state) {
        if (state is AuthenticatedState) return onAuthenticated();
        if (state is NotAuthenticatedState) return onNotAuthenticated();
      },
      child: child,
    );
  }
}
