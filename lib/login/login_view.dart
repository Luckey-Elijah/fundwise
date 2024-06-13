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
          final error = state.error;
          if (error == null) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error)),
          );
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
                    children: [_FormTitle(), Gutter(), _LoginForm()],
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

class _FormTitle extends StatelessWidget {
  const _FormTitle();

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

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final isLogin = context.select<LoginCubit, bool>(
      (cubit) => cubit.state.loginOrSignUp == LoginOrSignUp.login,
    );
    return AutofillGroup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: context.read<LoginCubit>().updateEmail,
            decoration: const InputDecoration(hintText: 'email'),
            autofillHints: [
              if (!isLogin) AutofillHints.newUsername,
              if (isLogin) AutofillHints.username,
            ],
          ),
          const Gutter(),
          TextField(
            obscureText: true,
            onChanged: context.read<LoginCubit>().updatePassword,
            decoration: const InputDecoration(hintText: 'password'),
            onSubmitted: (_) {
              if (isLogin) context.read<LoginCubit>().loginOrSignup();
            },
            autofillHints: [
              if (!isLogin) AutofillHints.newPassword,
              if (isLogin) AutofillHints.password,
            ],
          ),
          const Gutter(),
          AnimatedSize(
            duration: Durations.short4,
            child: isLogin ? const SizedBox.shrink() : const _ConfimColumn(),
          ),
          const Row(
            children: [
              _LoginOrSignUpButton(),
              Spacer(),
              _ToogleLoginSignUpButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class _ConfimColumn extends StatelessWidget {
  const _ConfimColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          obscureText: true,
          onSubmitted: (_) => context.read<LoginCubit>().loginOrSignup(),
          onChanged: context.read<LoginCubit>().updateConfirm,
          decoration: const InputDecoration(hintText: 'confirm'),
          autofillHints: const [AutofillHints.newPassword],
        ),
        const Gutter(),
      ],
    );
  }
}

class _LoginOrSignUpButton extends StatelessWidget {
  const _LoginOrSignUpButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<LoginCubit>().loginOrSignup,
      child: BlocSelector<LoginCubit, LoginState, bool>(
        selector: (state) => state.loginOrSignUp == LoginOrSignUp.login,
        builder: (context, login) => Text(login ? 'login' : 'signup'),
      ),
    );
  }
}

class _ToogleLoginSignUpButton extends StatelessWidget {
  const _ToogleLoginSignUpButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<LoginCubit>().toggleLoginOrSignUp,
      child: BlocSelector<LoginCubit, LoginState, bool>(
        selector: (state) => state.loginOrSignUp == LoginOrSignUp.login,
        builder: (context, login) =>
            Text(login ? 'go to sign up' : 'go to login'),
      ),
    );
  }
}
