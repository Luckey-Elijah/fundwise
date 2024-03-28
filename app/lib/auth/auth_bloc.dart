import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

class AuthEvent {}

class InitializeEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class AuthBloc extends Bloc<Object?, AuthState> {
  AuthBloc({required PocketBase pocketbase})
      : _pb = pocketbase,
        super(AuthState.unknown) {
    on<LogoutEvent>((_, __) => _pb.authStore.clear());
    on<InitializeEvent>(_onInitializeEvent);
  }

  Future<void> _onInitializeEvent(
    InitializeEvent event,
    Emitter<AuthState> emit,
  ) {
    Stream<AuthState> stream() async* {
      if (_pb.authStore.isValid) {
        yield AuthState.authenticated;
      }

      yield* _pb.authStore.onChange.map(
        (data) => data.token.isNotEmpty && data.model is RecordModel
            ? AuthState.authenticated
            : AuthState.unknown,
      );
    }

    return emit.forEach(
      stream(),
      onData: (data) => data,
    );
  }

  final PocketBase _pb;
}

enum AuthState {
  unknown,
  authenticated,
  unauthenticated,
}
