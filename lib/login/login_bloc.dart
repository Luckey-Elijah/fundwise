import 'package:app/login/login_state.dart';
import 'package:app/repository/auth_store.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginEvent {}

class InitializeLoginEvent extends LoginEvent {}

class ToggleRememberUsernameEvent extends LoginEvent {}

class ToggleLoginOrSignUpEvent extends LoginEvent {}

class LoginOrSignUpEvent extends LoginEvent {}

class UpdateLoginDetailEvent extends LoginEvent {
  UpdateLoginDetailEvent({
    this.email,
    this.password,
    this.confirm,
    this.username,
  });

  final String? email;
  final String? password;
  final String? confirm;
  final String? username;
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required SharedPreferences prefs,
    required AuthenticationStore auth,
  })  : _prefs = prefs,
        _auth = auth,
        super(LoginState.initial) {
    on<InitializeLoginEvent>((event, emit) {
      if (!_prefs.containsKey(_key)) return;
      emit(state.copyWith(rememberUsername: true));
      final emailOrUserName = _prefs.getString(_key);
      emit(state.copyWith(email: emailOrUserName));
    });
    on<ToggleRememberUsernameEvent>((event, emit) async {
      emit(state.copyWith(rememberUsername: !state.rememberUsername));

      if (state.rememberUsername) {
        await _prefs.setString(_key, state.email);
      } else {
        await _prefs.remove(_key);
      }
    });
    on<UpdateLoginDetailEvent>((event, emit) async {
      final UpdateLoginDetailEvent(
        :String? email,
        :String? password,
        :String? confirm,
        :String? username,
      ) = event;
      if (email != null) {
        emit(state.copyWith(email: email));
        if (state.rememberUsername) {
          await _prefs.setString(_key, state.email);
        }
      }
      if (password != null) emit(state.copyWith(password: password));
      if (confirm != null) emit(state.copyWith(confirm: confirm));
      if (username != null) emit(state.copyWith(username: username));
    });
    on<LoginOrSignUpEvent>((event, emit) async {
      emit(
        state.copyWith(loading: true),
      );

      if (state.loginOrSignUp == LoginOrSignUpState.login) {
        try {
          await _auth.signIn(
            usernameOrEmail: state.email,
            password: state.password,
          );
        } on Exception catch (e) {
          emit(state.copyWith(error: 'Could not login: $e'));
        }
        return;
      }

      final invalidPass = (state.password.isEmpty || state.confirm.isEmpty) &&
          (state.confirm != state.password);

      if (invalidPass) {
        emit(state.copyWith(error: 'provide matching password'));
      }

      if (state.email.isEmpty) {
        emit(state.copyWith(error: 'provide a email'));
      }

      if (state.username.isEmpty) {
        emit(state.copyWith(error: 'provide a username'));
      }

      try {
        emit(state.copyWith(loading: true));
        await _auth.signUp(
          username: state.username,
          email: state.email,
          password: state.password,
          confirm: state.confirm,
        );

        emit(state.copyWith(signUpSuccess: 'Sign up successful'));
      } on Exception catch (e) {
        emit(state.copyWith(error: 'Could not sign up: $e'));
      }
    });
    on<ToggleLoginOrSignUpEvent>((event, emit) {
      final next = state.loginOrSignUp == LoginOrSignUpState.login
          ? LoginOrSignUpState.signUp
          : LoginOrSignUpState.login;
      emit(
        state.copyWith(
          confirm: next == LoginOrSignUpState.login ? '' : state.confirm,
          loginOrSignUp: next,
        ),
      );
    });
  }
  final AuthenticationStore _auth;
  final SharedPreferences _prefs;

  static const _key = 'remember-username/email';
}
