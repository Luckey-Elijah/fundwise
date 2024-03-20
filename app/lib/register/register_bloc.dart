import 'dart:async';
import 'dart:io';

import 'package:app/register/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:pocketbase/pocketbase.dart';

part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required PocketBase pocketbase})
      : _pb = pocketbase,
        super(const RegisterState.init()) {
    on<UpdateUsernameEvent>(
      (ev, em) => em(state.copyWith(username: ev.username)),
    );
    on<UpdatePasswordEvent>(
      (ev, em) => em(state.copyWith(password: ev.password)),
    );
    on<UpdateConfirmPasswordEvent>(
      (ev, em) => em(state.copyWith(passwordConfirm: ev.confirmPassword)),
    );
    on<RegisterButtonPresed>(_onRegisterButtonPresed);
  }

  final PocketBase _pb;

  Future<void> _onRegisterButtonPresed(
    RegisterButtonPresed event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      emit(state.copyWith(status: RegisterStatus.loading));
      final record = await _pb.collection('users').create(body: state.toMap());
      stdout.writeln(record.data);
      emit(state.copyWith(status: RegisterStatus.success));
    } on Exception catch (e) {
      addError(e);
      return emit(state.copyWith(status: RegisterStatus.error));
    }
  }
}
