import 'package:app/auth/auth_bloc.dart';
import 'package:app/repository/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderScope extends StatelessWidget {
  const BlocProviderScope({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(context.read<AuthenticationStore>())
                ..add(InitializeAuthenticationEvent()),
        ),
      ],
      child: child,
    );
  }
}
