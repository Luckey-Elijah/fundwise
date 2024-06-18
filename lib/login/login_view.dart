import 'package:app/components/context_extension.dart';
import 'package:app/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error!)),
            );
          }

          if (state.signupSuccess != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.signupSuccess!)),
            );
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(const Size.fromWidth(480)),
              child: Card(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [FormTitle(), Gutter(), LoginForm()],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormTitle extends StatelessWidget {
  const FormTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final isLogin = context.select<LoginCubit, bool>(
      (cubit) => cubit.state.loginOrSignUp == LoginOrSignUp.login,
    );

    final style = Theme.of(context).textTheme.titleLarge;

    return AnimatedAlign(
      duration: Durations.short4,
      alignment: isLogin ? Alignment.topLeft : Alignment.topRight,
      child: AnimatedCrossFade(
        firstChild: Text('login', style: style),
        secondChild: Text('signup', style: style),
        crossFadeState:
            isLogin ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Durations.short4,
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isLogin = context.select<LoginCubit, bool>(
      (cubit) => cubit.state.loginOrSignUp == LoginOrSignUp.login,
    );

    final enabled = context.select<LoginCubit, bool>(
      (cubit) => !cubit.state.loading,
    );

    return AutofillGroup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EmailField(enabled: enabled, isLogin: isLogin),
          const Gutter(),
          PasswordField(enabled: enabled, isLogin: isLogin),
          const Gutter(),
          AnimatedSize(
            duration: Durations.short4,
            child: isLogin
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      ConfirmField(enabled: enabled),
                      const Gutter(),
                      UsernameField(enabled: enabled),
                      const Gutter(),
                    ],
                  ),
          ),
          const ServerUrlField(),
          Row(
            children: [
              LoginOrSignUpButton(enabled: enabled, isLogin: isLogin),
              const Spacer(),
              ToggleLoginSignUpButton(enabled: enabled, isLogin: isLogin),
            ],
          ),
        ],
      ),
    );
  }
}

class ServerUrlField extends StatefulWidget {
  const ServerUrlField({
    super.key,
  });

  @override
  State<ServerUrlField> createState() => _ServerUrlFieldState();
}

class _ServerUrlFieldState extends State<ServerUrlField> {
  late final controller = TextEditingController(text: context.pb.baseUrl);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'server url'),
            onChanged: (value) => context.pb.baseUrl = value,
          ),
        ),
        const Gutter(),
        ElevatedButton(
          child: const Text('check'),
          onPressed: () async {
            try {
              final check = await context.pb.health.check();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(check.message)),
                );
              }
            } on Exception catch (e) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$e')),
                );
              }
            }
          },
        ),
      ],
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.enabled,
    required this.isLogin,
    super.key,
  });

  final bool enabled;
  final bool isLogin;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> with ObscureState {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enabled,
      onChanged: context.read<LoginCubit>().updatePassword,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: 'password',
        suffixIcon: IconButton(
          onPressed: () => obscure = !obscure,
          icon: obscure
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
      ),
      onSubmitted: (_) {
        if (widget.isLogin) context.read<LoginCubit>().loginOrSignup();
      },
      autofillHints: [
        if (!widget.isLogin) AutofillHints.newPassword,
        if (widget.isLogin) AutofillHints.password,
      ],
    );
  }
}

mixin ObscureState<T extends StatefulWidget> on State<T> {
  bool _obscure = true;

  bool get obscure => _obscure;

  set obscure(bool value) {
    setState(() => _obscure = value);
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    required this.enabled,
    required this.isLogin,
    super.key,
  });

  final bool enabled;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      onChanged: context.read<LoginCubit>().updateEmail,
      decoration: const InputDecoration(hintText: 'email/username'),
      autofillHints: [
        if (!isLogin) AutofillHints.newUsername,
        if (isLogin) AutofillHints.username,
      ],
    );
  }
}

class ConfirmField extends StatefulWidget {
  const ConfirmField({
    required this.enabled,
    super.key,
  });
  final bool enabled;

  @override
  State<ConfirmField> createState() => _ConfirmFieldState();
}

class _ConfirmFieldState extends State<ConfirmField> with ObscureState {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      enabled: widget.enabled,
      onChanged: context.read<LoginCubit>().updateConfirm,
      decoration: InputDecoration(
        hintText: 'confirm',
        suffixIcon: IconButton(
          onPressed: () => obscure = !obscure,
          icon: obscure
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
      ),
      autofillHints: const [AutofillHints.newPassword],
    );
  }
}

class UsernameField extends StatelessWidget {
  const UsernameField({
    required this.enabled,
    super.key,
  });
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      onSubmitted: (_) => context.read<LoginCubit>().loginOrSignup(),
      onChanged: context.read<LoginCubit>().updateUsername,
      decoration: const InputDecoration(hintText: 'username'),
      autofillHints: const [AutofillHints.newUsername],
    );
  }
}

class LoginOrSignUpButton extends StatelessWidget {
  const LoginOrSignUpButton({
    required this.enabled,
    required this.isLogin,
    super.key,
  });

  final bool enabled;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? context.read<LoginCubit>().loginOrSignup : null,
      child: Text(isLogin ? 'login' : 'signup'),
    );
  }
}

class ToggleLoginSignUpButton extends StatelessWidget {
  const ToggleLoginSignUpButton({
    required this.enabled,
    required this.isLogin,
    super.key,
  });

  final bool enabled;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          enabled ? context.read<LoginCubit>().toggleLoginOrSignUp : null,
      child: Text(isLogin ? 'go to sign up' : 'go to login'),
    );
  }
}
