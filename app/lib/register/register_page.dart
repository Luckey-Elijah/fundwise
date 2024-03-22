import 'package:app/host/host_form.dart';
import 'package:app/register/register_bloc.dart';
import 'package:app/register/register_state.dart';
import 'package:app/routes.dart' as app;
import 'package:app/theme_extension/theme.dart';
import 'package:app/utility/build_context.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (c) => RegisterBloc(pocketbase: c.pocketbase),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: DecoratedBox(
                  decoration: context.decorationTheme.primary,
                  child: ConstrainedBox(
                    constraints: context.decorationTheme.smallWidth,
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: RegisterView(),
                    ),
                  ),
                ),
              ),
              const HostForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listenWhen: (prev, next) => prev.status != next.status,
      listener: (context, state) {
        if (state.status != RegisterStatus.success) return;
        context.pushReplacementNamed(app.Routes.login.path);
      },
      builder: (context, state) {
        final add = context.read<RegisterBloc>().add;

        final enabled = state.status != RegisterStatus.loading ||
            state.status != RegisterStatus.success;

        void register() => add(const RegisterButtonPresed());

        Future<void> login() =>
            context.pushReplacementNamed(app.Routes.login.path);

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              enabled: enabled,
              decoration: const InputDecoration(hintText: 'username'),
              autofillHints: const [AutofillHints.newUsername],
              onChanged: (value) => add(UpdateUsernameEvent(value)),
            ),
            context.marginTheme.small.box,
            TextField(
              enabled: enabled,
              decoration: const InputDecoration(hintText: 'password'),
              obscureText: true,
              autofillHints: const [AutofillHints.newPassword],
              onChanged: (value) => add(UpdatePasswordEvent(value)),
            ),
            context.marginTheme.small.box,
            TextField(
              enabled: enabled,
              onChanged: (value) => add(UpdateConfirmPasswordEvent(value)),
              decoration: const InputDecoration(
                hintText: 'confirm password',
              ),
              obscureText: true,
              autofillHints: const [AutofillHints.newPassword],
            ),
            context.marginTheme.small.box,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: enabled ? register : null,
                  child: const Text('register'),
                ),
                TextButton(
                  onPressed: enabled ? login : null,
                  child: const Text('go to login'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
