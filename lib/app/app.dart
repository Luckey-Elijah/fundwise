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
  late final router = duckRouter(auth: context.read<AuthenticationStore>());

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      builder: (context, child) {
        return _AuthListenable(router: router, child: child);
      },
    );
  }
}

class _AuthListenable extends StatelessWidget {
  const _AuthListenable({
    required this.child,
    required this.router,
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
