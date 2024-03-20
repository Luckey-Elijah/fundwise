part of 'register_bloc.dart';

final class RegisterState {
  const RegisterState({
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.error,
  });

  final String username;
  final String password;
  final String confirmPassword;
  final String? error;
}
