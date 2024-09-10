import 'package:dart_mappable/dart_mappable.dart';

part 'login_state.mapper.dart';

@MappableEnum()
enum LoginOrSignUpState { login, signUp }

@MappableClass()
class LoginState with LoginStateMappable {
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
    loginOrSignUp: LoginOrSignUpState.login,
    rememberUsername: false,
  );

  final String email;
  final String password;
  final String confirm;
  final String username;
  final LoginOrSignUpState loginOrSignUp;

  final bool loading;
  final String? error;
  final String? signUpSuccess;
  final bool rememberUsername;
}
