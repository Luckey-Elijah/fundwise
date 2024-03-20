import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

class AuthEvent {}

class InitializeEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

class AuthBloc extends Bloc<Object?, AuthState> {
  AuthBloc({required PocketBase pocketbase})
      : _pb = pocketbase,
        super(AuthState.unknown) {
    on<InitializeEvent>(
      (event, emit) => emit.forEach(
        _pb.authStore.onChange,
        onData: (data) {
          final model = data.model;
          if (data.token.isNotEmpty && model is RecordModel) {
            return AuthState.authenticated;
          }
          return AuthState.unknown;
        },
      ),
    );
  }
  final PocketBase _pb;
}

enum AuthState {
  unknown,
  authenticated,
  unauthenticated,
}
