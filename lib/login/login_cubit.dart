import 'package:app/repository/auth_store.dart';
import 'package:app/repository/pocketbase.dart';
import 'package:bloc/bloc.dart';

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

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial);

  // ignore: avoid_setters_without_getters
  set value(LoginState value) {
    emit(value);
  }

  Future<void> initialize() async {
    if (!preferences$.containsKey(_key)) return;

    value = LoginState(
      email: state.email,
      password: state.password,
      confirm: state.confirm,
      username: state.username,
      loginOrSignUp: state.loginOrSignUp,
      rememberUsername: true,
    );

    final emailOrUserName = preferences$.getString(_key);

    value = LoginState(
      email: emailOrUserName ?? state.email,
      password: state.password,
      confirm: state.confirm,
      username: state.username,
      loginOrSignUp: state.loginOrSignUp,
      rememberUsername: state.rememberUsername,
    );
  }

  Future<void> toggleRememberUsername() async {
    value = LoginState(
      email: state.email,
      password: state.password,
      confirm: state.confirm,
      username: state.username,
      loginOrSignUp: state.loginOrSignUp,
      rememberUsername: !state.rememberUsername,
    );

    if (state.rememberUsername) {
      await preferences$.setString(_key, state.email);
    } else {
      await preferences$.remove(_key);
    }
  }

  static const _key = 'remember-username/email';

  Future<void> updateEmail(String email) async {
    value = LoginState(
      rememberUsername: state.rememberUsername,
      email: email,
      password: state.password,
      confirm: state.confirm,
      username: state.username,
      loginOrSignUp: state.loginOrSignUp,
    );
    if (state.rememberUsername) {
      await preferences$.setString(_key, state.email);
    }
  }

  void updatePassword(String password) {
    value = LoginState(
      rememberUsername: state.rememberUsername,
      password: password,
      username: state.username,
      confirm: state.confirm,
      loginOrSignUp: state.loginOrSignUp,
      email: state.email,
    );
  }

  void updateConfirm(String confirm) {
    value = LoginState(
      rememberUsername: state.rememberUsername,
      username: state.username,
      confirm: confirm,
      password: state.password,
      loginOrSignUp: state.loginOrSignUp,
      email: state.email,
    );
  }

  void updateUsername(String username) {
    value = LoginState(
      rememberUsername: state.rememberUsername,
      username: username,
      confirm: state.confirm,
      password: state.password,
      loginOrSignUp: state.loginOrSignUp,
      email: state.email,
    );
  }

  Future<void> loginOrSignUp() async {
    value = LoginState(
      rememberUsername: state.rememberUsername,
      email: state.email,
      username: state.username,
      password: state.password,
      confirm: state.confirm,
      loginOrSignUp: state.loginOrSignUp,
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
      value = LoginState(
        rememberUsername: state.rememberUsername,
        email: state.email,
        username: state.username,
        password: state.password,
        confirm: state.confirm,
        loginOrSignUp: state.loginOrSignUp,
        error: 'Could not login: $e',
      );
    }
  }

  Future<void> _signUp() async {
    final invalidPass = (state.password.isEmpty || state.confirm.isEmpty) &&
        (state.confirm != state.password);
    if (invalidPass) {
      value = LoginState(
        rememberUsername: state.rememberUsername,
        email: state.email,
        username: state.username,
        password: state.password,
        confirm: state.confirm,
        error: 'provide matching password',
        loginOrSignUp: state.loginOrSignUp,
      );
    }

    if (state.email.isEmpty) {
      value = LoginState(
        rememberUsername: state.rememberUsername,
        email: state.email,
        username: state.username,
        password: state.password,
        confirm: state.confirm,
        error: 'provide a email',
        loginOrSignUp: state.loginOrSignUp,
      );
    }

    if (state.username.isEmpty) {
      value = LoginState(
        rememberUsername: state.rememberUsername,
        email: state.email,
        username: state.username,
        password: state.password,
        confirm: state.confirm,
        error: 'provide a username',
        loginOrSignUp: state.loginOrSignUp,
      );
    }

    try {
      await authentication$.signUp(
        username: state.username,
        email: state.email,
        password: state.password,
        confirm: state.confirm,
      );

      value = LoginState(
        rememberUsername: state.rememberUsername,
        email: state.email,
        username: state.username,
        password: state.password,
        confirm: state.confirm,
        loginOrSignUp: state.loginOrSignUp,
      );
    } on Exception catch (e) {
      value = LoginState(
        rememberUsername: state.rememberUsername,
        email: state.email,
        username: state.username,
        password: state.password,
        confirm: state.confirm,
        loginOrSignUp: state.loginOrSignUp,
        error: 'Could not sign up: $e',
      );
    }
  }

  void toggleLoginOrSignUp() {
    final next = state.loginOrSignUp == LoginOrSignUp.login
        ? LoginOrSignUp.signUp
        : LoginOrSignUp.login;
    value = LoginState(
      rememberUsername: state.rememberUsername,
      email: state.email,
      username: state.username,
      password: state.password,
      confirm: next == LoginOrSignUp.login ? '' : state.confirm,
      loginOrSignUp: next,
    );
  }
}
