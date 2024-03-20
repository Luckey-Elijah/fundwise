import 'package:dart_mappable/dart_mappable.dart';

part 'register_state.mapper.dart';

@MappableClass()
class RegisterState with RegisterStateMappable {
  const RegisterState({
    required this.email,
    required this.name,
    required this.username,
    required this.password,
    required this.passwordConfirm,
    this.emailVisibility = true,
    this.status = RegisterStatus.loaded,
  });

  const RegisterState.init()
      : this(
          email: '',
          name: '',
          username: '',
          password: '',
          passwordConfirm: '',
        );

  final String username;
  final String email;
  final String name;
  final bool emailVisibility;
  final String password;
  final String passwordConfirm;
  final RegisterStatus status;
}

@MappableEnum()
enum RegisterStatus { loaded, loading, error, success }
