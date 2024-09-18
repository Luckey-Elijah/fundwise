import 'package:app/authentication/authentication_bloc.dart';
import 'package:app/repository/repository.dart';
import 'package:app/startup/startup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderScope extends StatelessWidget {
  const BlocProviderScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => StartUpBloc(
            url: context.read<UrlRepository>(),
            logging: context.read<LoggingRepository>(),
            licensing: context.read<LicensingRepository>(),
            auth: context.read<AuthenticationRepository>(),
          )..add(InitializeStartUpEvent(const Duration(seconds: 2))),
        ),
        BlocProvider(
          lazy: false,
          create: (context) =>
              AuthenticationBloc(context.read<AuthenticationRepository>())
                ..add(InitializeAuthenticationEvent()),
        ),
      ],
      child: child,
    );
  }
}
