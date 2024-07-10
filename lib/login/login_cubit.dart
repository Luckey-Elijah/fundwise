import 'package:app/repository/auth_store.dart';
import 'package:app/repository/pocketbase.dart';
import 'package:flutter/foundation.dart';

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
}

final login$ = LoginStore()..initialize();

class LoginStore extends ValueNotifier<LoginState> {
  LoginStore() : super(LoginState.initial);

  Future<void> initialize() async {
    if (!preferences$.containsKey(_key)) return;

    value = LoginState(
      email: value.email,
      password: value.password,
      confirm: value.confirm,
      username: value.username,
      loginOrSignUp: value.loginOrSignUp,
      rememberUsername: true,
    );

    final emailOrUserName = preferences$.getString(_key);

    value = LoginState(
      email: emailOrUserName ?? value.email,
      password: value.password,
      confirm: value.confirm,
      username: value.username,
      loginOrSignUp: value.loginOrSignUp,
      rememberUsername: value.rememberUsername,
    );
  }

  Future<void> toggleRememberUsername() async {
    value = LoginState(
      email: value.email,
      password: value.password,
      confirm: value.confirm,
      username: value.username,
      loginOrSignUp: value.loginOrSignUp,
      rememberUsername: !value.rememberUsername,
    );

    if (value.rememberUsername) {
      await preferences$.setString(_key, value.email);
    } else {
      await preferences$.remove(_key);
    }
  }

  static const _key = 'remember-username/email';

  Future<void> updateEmail(String email) async {
    value = LoginState(
      rememberUsername: value.rememberUsername,
      email: email,
      password: value.password,
      confirm: value.confirm,
      username: value.username,
      loginOrSignUp: value.loginOrSignUp,
    );
    if (value.rememberUsername) {
      await preferences$.setString(_key, value.email);
    }
  }

  void updatePassword(String password) {
    value = LoginState(
      rememberUsername: value.rememberUsername,
      password: password,
      username: value.username,
      confirm: value.confirm,
      loginOrSignUp: value.loginOrSignUp,
      email: value.email,
    );
  }

  void updateConfirm(String confirm) {
    value = LoginState(
      rememberUsername: value.rememberUsername,
      username: value.username,
      confirm: confirm,
      password: value.password,
      loginOrSignUp: value.loginOrSignUp,
      email: value.email,
    );
  }

  void updateUsername(String username) {
    value = LoginState(
      rememberUsername: value.rememberUsername,
      username: username,
      confirm: value.confirm,
      password: value.password,
      loginOrSignUp: value.loginOrSignUp,
      email: value.email,
    );
  }

  Future<void> loginOrSignUp() async {
    value = LoginState(
      rememberUsername: value.rememberUsername,
      email: value.email,
      username: value.username,
      password: value.password,
      confirm: value.confirm,
      loginOrSignUp: value.loginOrSignUp,
    );

    if (value.loginOrSignUp == LoginOrSignUp.login) {
      await _login();
    } else {
      await _signUp();
    }
  }

  Future<void> _login() async {
    try {
      await authentication$.signIn(
        usernameOrEmail: value.email,
        password: value.password,
      );
    } on Exception catch (e) {
      value = LoginState(
        rememberUsername: value.rememberUsername,
        email: value.email,
        username: value.username,
        password: value.password,
        confirm: value.confirm,
        loginOrSignUp: value.loginOrSignUp,
        error: 'Could not login: $e',
      );
    }
  }

  Future<void> _signUp() async {
    final invalidPass = (value.password.isEmpty || value.confirm.isEmpty) &&
        (value.confirm != value.password);
    if (invalidPass) {
      value = LoginState(
        rememberUsername: value.rememberUsername,
        email: value.email,
        username: value.username,
        password: value.password,
        confirm: value.confirm,
        error: 'provide matching password',
        loginOrSignUp: value.loginOrSignUp,
      );
    }

    if (value.email.isEmpty) {
      value = LoginState(
        rememberUsername: value.rememberUsername,
        email: value.email,
        username: value.username,
        password: value.password,
        confirm: value.confirm,
        error: 'provide a email',
        loginOrSignUp: value.loginOrSignUp,
      );
    }

    if (value.username.isEmpty) {
      value = LoginState(
        rememberUsername: value.rememberUsername,
        email: value.email,
        username: value.username,
        password: value.password,
        confirm: value.confirm,
        error: 'provide a username',
        loginOrSignUp: value.loginOrSignUp,
      );
    }

    try {
      await authentication$.signUp(
        username: value.username,
        email: value.email,
        password: value.password,
        confirm: value.confirm,
      );

      value = LoginState(
        rememberUsername: value.rememberUsername,
        email: value.email,
        username: value.username,
        password: value.password,
        confirm: value.confirm,
        loginOrSignUp: value.loginOrSignUp,
      );
    } on Exception catch (e) {
      value = LoginState(
        rememberUsername: value.rememberUsername,
        email: value.email,
        username: value.username,
        password: value.password,
        confirm: value.confirm,
        loginOrSignUp: value.loginOrSignUp,
        error: 'Could not sign up: $e',
      );
    }
  }

  void toggleLoginOrSignUp() {
    final next = value.loginOrSignUp == LoginOrSignUp.login
        ? LoginOrSignUp.signUp
        : LoginOrSignUp.login;
    value = LoginState(
      rememberUsername: value.rememberUsername,
      email: value.email,
      username: value.username,
      password: value.password,
      confirm: next == LoginOrSignUp.login ? '' : value.confirm,
      loginOrSignUp: next,
    );
  }
}
