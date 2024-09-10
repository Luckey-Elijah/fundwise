import 'package:app/repository/auth_store.dart';
import 'package:bloc/bloc.dart';
import 'package:pocketbase/pocketbase.dart';

abstract class AuthenticationEvent {}

class InitializeAuthenticationEvent extends AuthenticationEvent {}

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._auth) : super(UnknownAuthenticatedState()) {
    on<InitializeAuthenticationEvent>((event, emit) async {
      final model = await _auth.refresh();
      if (model is RecordModel) emit(AuthenticatedState());

      await emit.forEach(
        _auth.stream,
        onData: (event) {
          if (event.token.isNotEmpty && event.model is RecordModel) {
            return AuthenticatedState();
          } else {
            return NotAuthenticatedState();
          }
        },
      );
    });
  }
  final AuthenticationStore _auth;
}

abstract class AuthenticationState {}

class UnknownAuthenticatedState extends AuthenticationState {}

class NotAuthenticatedState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {}
