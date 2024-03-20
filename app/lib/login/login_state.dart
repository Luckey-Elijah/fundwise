import 'package:dart_mappable/dart_mappable.dart';

part 'login_state.mapper.dart';

@MappableClass()
class LoginState with LoginStateMappable {
  const LoginState({
    required this.username,
    required this.password,
    this.status = LoginStatus.loaded,
  });
  const LoginState.initial() : this(password: '', username: '');

  final String username;
  final String password;
  final LoginStatus status;
}

@MappableEnum()
enum LoginStatus { loaded, loading, error, success }
