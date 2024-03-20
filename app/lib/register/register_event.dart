part of 'register_bloc.dart';

sealed class RegisterEvent {
  const RegisterEvent();
}

class UpdateUsernameEvent extends RegisterEvent {
  const UpdateUsernameEvent(this.username);

  final String username;
}

class UpdatePasswordEvent extends RegisterEvent {
  const UpdatePasswordEvent(this.password);

  final String password;
}

class UpdateConfirmPasswordEvent extends RegisterEvent {
  const UpdateConfirmPasswordEvent(this.confirmPassword);

  final String confirmPassword;
}

class RegisterButtonPresed extends RegisterEvent {
  const RegisterButtonPresed();
}
