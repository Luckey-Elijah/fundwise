import 'package:app/repository/repository.dart';
import 'package:bloc/bloc.dart';

abstract class AuthenticationEvent {}

class InitializeAuthenticationEvent extends AuthenticationEvent {}

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._auth) : super(UnknownAuthenticatedState()) {
    on<InitializeAuthenticationEvent>((event, emit) async {
      final model = await _auth.refresh();

      if (model is RecordModel) {
        emit(AuthenticatedState());
      } else {
        emit(NotAuthenticatedState());
      }

      await emit.forEach(
        _auth.stream,
        onData: (event) {
          if (event.token.isNotEmpty && event.record != null) {
            return AuthenticatedState();
          } else {
            return NotAuthenticatedState();
          }
        },
      );
    });
  }
  final AuthenticationRepository _auth;
}

abstract class AuthenticationState {}

class UnknownAuthenticatedState extends AuthenticationState {}

class NotAuthenticatedState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {}
