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
    return BlocProvider(
      create: (c) => LoginBloc(pocketbase: c.pocketbase),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: DecoratedBox(
              decoration: context.decorationTheme.primary,
              child: ConstrainedBox(
                constraints: context.decorationTheme.smallWidth,
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: LoginView(),
                ),
              ),
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
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (prev, next) => prev.status != next.status,
      listener: (context, state) {
        if (state.status != LoginStatus.success) return;
        context.pushReplacementNamed(app.Routes.dashboard.path);
      },
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
                  child: const Text('register'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
