import 'package:app/login/login_bloc.dart';
import 'package:app/login/login_state.dart';
import 'package:app/routes.dart' as app;
import 'package:app/theme_extension/theme.dart';
import 'package:app/utility/build_context.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ConstrainedBox(
            constraints: context.decorationTheme.smallWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'login',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                DecoratedBox(
                  decoration: context.decorationTheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: BlocProvider(
                      create: (c) => LoginBloc(pocketbase: c.pocketbase),
                      child: const LoginView(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        final add = context.read<LoginBloc>().add;
        final enabled = state.status != LoginStatus.loading ||
            state.status != LoginStatus.success;
        Future<void> register() =>
            context.pushReplacementNamed(app.Routes.register.path);
        void login() => add(const LoginButtonPressed());
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              enabled: enabled,
              onChanged: (value) => add(UpdateUsernameEvent(value)),
              decoration: const InputDecoration(hintText: 'username'),
              autofillHints: const [AutofillHints.username],
            ),
            context.marginTheme.small.box,
            TextField(
              enabled: enabled,
              onChanged: (value) => add(UpdatePasswordEvent(value)),
              decoration: const InputDecoration(hintText: 'password'),
              obscureText: true,
              onSubmitted: (_) => login(),
              autofillHints: const [AutofillHints.password],
            ),
            context.marginTheme.small.box,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: enabled ? login : null,
                  child: const Text('login'),
                ),
                TextButton(
                  onPressed: enabled ? register : null,
                  child: const Text('go to register'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
