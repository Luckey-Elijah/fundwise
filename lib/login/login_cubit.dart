import 'package:app/repository/auth.repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum LoginOrSignUp { login, signup }

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
    this.signupSuccess,
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
  final String? signupSuccess;
  final bool rememberUsername;
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.authRepository,
    required this.prefs,
  }) : super(LoginState.initial);

  final AuthRepository authRepository;
  final SharedPreferences prefs;

  Future<void> initialize() async {
    if (!prefs.containsKey(_key)) return;

    emit(
      LoginState(
        email: state.email,
        password: state.password,
        confirm: state.confirm,
        username: state.username,
        loginOrSignUp: state.loginOrSignUp,
        rememberUsername: true,
      ),
    );

    final emailOrUserName = prefs.getString(_key);

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
      await prefs.setString(_key, state.email);
    } else {
      await prefs.remove(_key);
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
      await prefs.setString(_key, state.email);
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

  Future<void> loginOrSignup() async {
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
      await authRepository.signIn(
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
      return emit(
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
      return emit(
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
      return emit(
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
      await authRepository.signUp(
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
        ? LoginOrSignUp.signup
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
