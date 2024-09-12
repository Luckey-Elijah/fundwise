import 'package:app/auth/auth_bloc.dart';
import 'package:app/repository/auth_store.dart';
import 'package:app/repository/licensing_store.dart';
import 'package:app/repository/logging_store.dart';
import 'package:app/repository/url_store.dart';
import 'package:app/startup/startup_bloc.dart';
import 'package:app/startup/startup_event.dart';
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
            url: context.read<UrlStore>(),
            logging: context.read<LoggingStore>(),
            licensing: context.read<LicensingStore>(),
            auth: context.read<AuthenticationStore>(),
          )..add(InitializeStartUpEvent()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) =>
              AuthenticationBloc(context.read<AuthenticationStore>())
                ..add(InitializeAuthenticationEvent()),
        ),
      ],
      child: child,
    );
  }
}
