import 'package:app/components/value_notifier_listener.dart';
import 'package:app/login/login_cubit.dart';
import 'package:app/server/server_url_field.dart';
import 'package:context_plus/context_plus.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with ValueNotifierListener<LoginState, LoginStore, LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  @override
  void listen(LoginState previous, LoginState next) {
    if (next.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(next.error!)),
      );
    }

    if (next.signUpSuccess != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(next.signUpSuccess!)),
      );
    }
  }

  @override
  LoginStore get notifier => login$;
}

class FormTitle extends StatelessWidget {
  const FormTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final isLogin = login$.watchOnly(
      context,
      (store) => store.value.loginOrSignUp == LoginOrSignUp.login,
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
    final isLogin = login$.watchOnly(
      context,
      (store) => store.value.loginOrSignUp == LoginOrSignUp.login,
    );

    final enabled = login$.watchOnly(
      context,
      (store) => !store.value.loading,
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
      onChanged: login$.updatePassword,
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
        if (widget.isLogin) login$.loginOrSignUp();
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
  late final controller = TextEditingController(text: login$.value.email);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          enabled: widget.enabled,
          onChanged: login$.updateEmail,
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
    final value =
        login$.watchOnly(context, (store) => store.value.rememberUsername);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('remember username'),
        Checkbox.adaptive(
          value: value,
          onChanged: (_) => login$.toggleRememberUsername(),
        ),
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
      onChanged: login$.updateConfirm,
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
      onSubmitted: (_) => login$.loginOrSignUp(),
      onChanged: login$.updateUsername,
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
      onPressed: enabled ? login$.loginOrSignUp : null,
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
      onPressed: enabled ? login$.toggleLoginOrSignUp : null,
      child: Text(isLogin ? 'go to sign up' : 'go to login'),
    );
  }
}
