part of 'login_bloc.dart';

sealed class LoginEvent {
  const LoginEvent();
}

class UpdateUsernameEvent extends LoginEvent {
  const UpdateUsernameEvent(this.value);

  final String value;
}

class UpdatePasswordEvent extends LoginEvent {
  const UpdatePasswordEvent(this.value);

  final String value;
}

class LoginButtonPressed extends LoginEvent {
  const LoginButtonPressed();
}
