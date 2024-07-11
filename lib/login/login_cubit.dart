import 'package:app/repository/auth_store.dart';
import 'package:app/repository/pocketbase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum LoginOrSignUp { login, signUp }

class LoginState {
  const LoginState({
    required this.email,
    required this.password,
    required this.confirm,
    required this.username,
    required this.loginOrSignUp,
    required this.rememberUsername,
    this.error,
    this.loading = false,
    this.signUpSuccess,
  });

  static const initial = LoginState(
    email: '',
    password: '',
    username: '',
    confirm: '',
    loginOrSignUp: LoginOrSignUp.login,
    rememberUsername: false,
  );

  final String email;
  final String password;
  final String confirm;
  final String username;
  final LoginOrSignUp loginOrSignUp;

  final bool loading;
  final String? error;
  final String? signUpSuccess;
  final bool rememberUsername;

  LoginState copyWith({
    String? email,
    String? password,
    String? confirm,
    String? username,
    LoginOrSignUp? loginOrSignUp,
    bool? loading = false,
    ValueGetter<String?>? error,
    ValueGetter<String?>? signUpSuccess,
    bool? rememberUsername,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirm: confirm ?? this.confirm,
      username: username ?? this.username,
      loginOrSignUp: loginOrSignUp ?? this.loginOrSignUp,
      loading: loading ?? this.loading,
      error: error != null //

          ? error.call()
          : this.error,
      signUpSuccess: signUpSuccess != null //
          ? signUpSuccess()
          : this.signUpSuccess,
      rememberUsername: rememberUsername ?? this.rememberUsername,
    );
  }
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial);

  Future<void> initialize() async {
    if (!preferences$.containsKey(_key)) return;

    emit(state.copyWith(rememberUsername: true));

    final emailOrUserName = preferences$.getString(_key);

    emit(state.copyWith(email: emailOrUserName));
  }

  Future<void> toggleRememberUsername() async {
    emit(state.copyWith(rememberUsername: !state.rememberUsername));

    if (state.rememberUsername) {
      await preferences$.setString(_key, state.email);
    } else {
      await preferences$.remove(_key);
    }
  }

  static const _key = 'remember-username/email';

  Future<void> updateEmail(String email) async {
    emit(state.copyWith(email: email));
    if (state.rememberUsername) {
      await preferences$.setString(_key, state.email);
    }
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void updateConfirm(String confirm) {
    emit(state.copyWith(confirm: confirm));
  }

  void updateUsername(String username) {
    emit(state.copyWith(username: username));
  }

  Future<void> loginOrSignUp() async {
    emit(
      state.copyWith(loading: true),
    );

    if (state.loginOrSignUp == LoginOrSignUp.login) {
      await _login();
      return;
    }

    await _signUp();
  }

  Future<void> _login() async {
    try {
      await authentication$.signIn(
        usernameOrEmail: state.email,
        password: state.password,
      );
    } on Exception catch (e) {
      emit(state.copyWith(error: () => 'Could not login: $e'));
    }
  }

  Future<void> _signUp() async {
    final invalidPass = (state.password.isEmpty || state.confirm.isEmpty) &&
        (state.confirm != state.password);

    if (invalidPass) {
      emit(state.copyWith(error: () => 'provide matching password'));
    }

    if (state.email.isEmpty) {
      emit(state.copyWith(error: () => 'provide a email'));
    }

    if (state.username.isEmpty) {
      emit(state.copyWith(error: () => 'provide a username'));
    }

    try {
      emit(state.copyWith(loading: true));
      await authentication$.signUp(
        username: state.username,
        email: state.email,
        password: state.password,
        confirm: state.confirm,
      );

      emit(state.copyWith(signUpSuccess: () => 'Sign up successful'));
    } on Exception catch (e) {
      emit(state.copyWith(error: () => 'Could not sign up: $e'));
    }
  }

  void toggleLoginOrSignUp() {
    final next = state.loginOrSignUp == LoginOrSignUp.login
        ? LoginOrSignUp.signUp
        : LoginOrSignUp.login;
    emit(
      LoginState(
        rememberUsername: state.rememberUsername,
        email: state.email,
        username: state.username,
        password: state.password,
        confirm: next == LoginOrSignUp.login ? '' : state.confirm,
        loginOrSignUp: next,
      ),
    );
  }
}
