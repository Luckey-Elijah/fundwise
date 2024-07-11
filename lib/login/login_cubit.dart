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
    bool? loading,
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

    emit(
      LoginState(
        email: emailOrUserName ?? state.email,
        password: state.password,
        confirm: state.confirm,
        username: state.username,
        loginOrSignUp: state.loginOrSignUp,
        rememberUsername: state.rememberUsername,
      ),
    );
  }

  Future<void> toggleRememberUsername() async {
    emit(
      LoginState(
        email: state.email,
        password: state.password,
        confirm: state.confirm,
        username: state.username,
        loginOrSignUp: state.loginOrSignUp,
        rememberUsername: !state.rememberUsername,
      ),
    );

    if (state.rememberUsername) {
      await preferences$.setString(_key, state.email);
    } else {
      await preferences$.remove(_key);
    }
  }

  static const _key = 'remember-username/email';

  Future<void> updateEmail(String email) async {
    emit(
      LoginState(
        rememberUsername: state.rememberUsername,
        email: email,
        password: state.password,
        confirm: state.confirm,
        username: state.username,
        loginOrSignUp: state.loginOrSignUp,
      ),
    );
    if (state.rememberUsername) {
      await preferences$.setString(_key, state.email);
    }
  }

  void updatePassword(String password) {
    emit(
      LoginState(
        rememberUsername: state.rememberUsername,
        password: password,
        username: state.username,
        confirm: state.confirm,
        loginOrSignUp: state.loginOrSignUp,
        email: state.email,
      ),
    );
  }

  void updateConfirm(String confirm) {
    emit(
      LoginState(
        rememberUsername: state.rememberUsername,
        username: state.username,
        confirm: confirm,
        password: state.password,
        loginOrSignUp: state.loginOrSignUp,
        email: state.email,
      ),
    );
  }

  void updateUsername(String username) {
    emit(
      LoginState(
        rememberUsername: state.rememberUsername,
        username: username,
        confirm: state.confirm,
        password: state.password,
        loginOrSignUp: state.loginOrSignUp,
        email: state.email,
      ),
    );
  }

  Future<void> loginOrSignUp() async {
    emit(
      LoginState(
        rememberUsername: state.rememberUsername,
        email: state.email,
        username: state.username,
        password: state.password,
        confirm: state.confirm,
        loginOrSignUp: state.loginOrSignUp,
      ),
    );

    if (state.loginOrSignUp == LoginOrSignUp.login) {
      await _login();
    } else {
      await _signUp();
    }
  }

  Future<void> _login() async {
    try {
      await authentication$.signIn(
        usernameOrEmail: state.email,
        password: state.password,
      );
    } on Exception catch (e) {
      emit(
        LoginState(
          rememberUsername: state.rememberUsername,
          email: state.email,
          username: state.username,
          password: state.password,
          confirm: state.confirm,
          loginOrSignUp: state.loginOrSignUp,
          error: 'Could not login: $e',
        ),
      );
    }
  }

  Future<void> _signUp() async {
    final invalidPass = (state.password.isEmpty || state.confirm.isEmpty) &&
        (state.confirm != state.password);
    if (invalidPass) {
      emit(
        LoginState(
          rememberUsername: state.rememberUsername,
          email: state.email,
          username: state.username,
          password: state.password,
          confirm: state.confirm,
          error: 'provide matching password',
          loginOrSignUp: state.loginOrSignUp,
        ),
      );
    }

    if (state.email.isEmpty) {
      emit(
        LoginState(
          rememberUsername: state.rememberUsername,
          email: state.email,
          username: state.username,
          password: state.password,
          confirm: state.confirm,
          error: 'provide a email',
          loginOrSignUp: state.loginOrSignUp,
        ),
      );
    }

    if (state.username.isEmpty) {
      emit(
        LoginState(
          rememberUsername: state.rememberUsername,
          email: state.email,
          username: state.username,
          password: state.password,
          confirm: state.confirm,
          error: 'provide a username',
          loginOrSignUp: state.loginOrSignUp,
        ),
      );
    }

    try {
      await authentication$.signUp(
        username: state.username,
        email: state.email,
        password: state.password,
        confirm: state.confirm,
      );

      emit(
        LoginState(
          rememberUsername: state.rememberUsername,
          email: state.email,
          username: state.username,
          password: state.password,
          confirm: state.confirm,
          loginOrSignUp: state.loginOrSignUp,
        ),
      );
    } on Exception catch (e) {
      emit(
        LoginState(
          rememberUsername: state.rememberUsername,
          email: state.email,
          username: state.username,
          password: state.password,
          confirm: state.confirm,
          loginOrSignUp: state.loginOrSignUp,
          error: 'Could not sign up: $e',
        ),
      );
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
