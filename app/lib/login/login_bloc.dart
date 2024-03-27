import 'dart:async';

import 'package:app/login/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:pocketbase/pocketbase.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required PocketBase pocketbase})
      : _pb = pocketbase,
        super(const LoginState.initial()) {
    on<UpdateUsernameEvent>(
      (event, emit) => emit(state.copyWith(username: event.value)),
    );
    on<UpdatePasswordEvent>(
      (event, emit) => emit(state.copyWith(password: event.value)),
    );
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  final PocketBase _pb;

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await _pb
          .collection('users')
          .authWithPassword(state.username, state.password);
      return emit(state.copyWith(status: LoginStatus.success));
    } on Exception catch (e) {
      addError(e);
      return emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
