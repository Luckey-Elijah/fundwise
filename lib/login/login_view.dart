import 'package:app/login/login_bloc.dart';
import 'package:app/login/login_state.dart';
import 'package:app/server/server_cubit.dart';
import 'package:app/server/server_url_field.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

void _loginListener(BuildContext context, LoginState state) {
  if (state.error != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.error!)),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: _loginListener,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(const Size.fromWidth(480)),
              child: Card.outlined(
                color: context.primaryContainer,
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
    final isLogin = context.select<LoginBloc, bool>(
      (store) => store.state.loginOrSignUp == LoginOrSignUpState.login,
    );

    return AnimatedAlign(
      duration: Durations.short4,
      alignment: isLogin ? Alignment.topLeft : Alignment.topRight,
      child: AnimatedCrossFade(
        firstChild: Text('login', style: context.h1),
        secondChild: Text('signup', style: context.h1),
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
    final isLogin = context.select<LoginBloc, bool>(
      (cubit) => cubit.state.loginOrSignUp == LoginOrSignUpState.login,
    );

    final enabled = context.select<LoginBloc, bool>(
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
          BlocProvider(
            create: (_) => ServerCubit()..initialize(),
            child: const ServerUrlField(),
          ),
          const Gutter(),
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
      onChanged: (password) => context
          .read<LoginBloc>()
          .add(UpdateLoginDetailEvent(password: password)),
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
        if (widget.isLogin) context.read<LoginBloc>().add(LoginOrSignUpEvent());
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

class EmailField extends StatefulWidget {
  const EmailField({
    required this.enabled,
    required this.isLogin,
    super.key,
  });

  final bool enabled;
  final bool isLogin;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  late final controller = TextEditingController(
    text: context.read<LoginBloc>().state.email,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          enabled: widget.enabled,
          onChanged: (email) => context
              .read<LoginBloc>()
              .add(UpdateLoginDetailEvent(email: email)),
          decoration: InputDecoration(
            hintText: widget.isLogin ? 'email/username' : 'email',
          ),
          autofillHints: [
            if (!widget.isLogin) AutofillHints.newUsername,
            if (widget.isLogin) AutofillHints.username,
          ],
        ),
        AnimatedSize(
          duration: Durations.medium1,
          child: widget.isLogin
              ? const RememberUserNameCheckBox()
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class RememberUserNameCheckBox extends StatelessWidget {
  const RememberUserNameCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final value = context.select<LoginBloc, bool>(
      (store) => store.state.rememberUsername,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('remember username'),
        Checkbox.adaptive(
          value: value,
          onChanged: (_) =>
              context.read<LoginBloc>().add(ToggleRememberUsernameEvent()),
        ),
      ],
    );
  }
}

class ConfirmField extends StatefulWidget {
  const ConfirmField({required this.enabled, super.key});
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
      onChanged: (confirm) => context
          .read<LoginBloc>()
          .add(UpdateLoginDetailEvent(confirm: confirm)),
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
      onSubmitted: (_) => context.read<LoginBloc>().add(LoginOrSignUpEvent()),
      onChanged: (username) => context
          .read<LoginBloc>()
          .add(UpdateLoginDetailEvent(username: username)),
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
      onPressed: enabled
          ? () => context.read<LoginBloc>().add(LoginOrSignUpEvent())
          : null,
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
      onPressed: enabled
          ? () => context.read<LoginBloc>().add(ToggleLoginOrSignUpEvent())
          : null,
      child: Text(isLogin ? 'go to sign up' : 'go to login'),
    );
  }
}
