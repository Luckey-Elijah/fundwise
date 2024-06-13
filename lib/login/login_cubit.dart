import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum LoginOrSignUp { login, signup }

class LoginState {
  const LoginState({
    required this.email,
    required this.password,
    required this.confirm,
    required this.loginOrSignUp,
    this.error,
    this.loading = false,
  });

  static const initial = LoginState(
    email: '',
    password: '',
    confirm: '',
    loginOrSignUp: LoginOrSignUp.login,
  );

  final String email;
  final String password;
  final String confirm;
  final LoginOrSignUp loginOrSignUp;

  final String? error;
  final bool loading;
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.supabase,
  }) : super(LoginState.initial);

  final SupabaseClient supabase;

  void updateEmail(String email) {
    emit(
      LoginState(
        email: email,
        password: state.password,
        confirm: state.confirm,
        loginOrSignUp: state.loginOrSignUp,
      ),
    );
  }

  void updatePassword(String password) {
    emit(
      LoginState(
        password: password,
        confirm: state.confirm,
        loginOrSignUp: state.loginOrSignUp,
        email: state.email,
      ),
    );
  }

  void updateConfirm(String confirm) {
    emit(
      LoginState(
        confirm: confirm,
        password: state.password,
        loginOrSignUp: state.loginOrSignUp,
        email: state.email,
      ),
    );
  }

  Future<void> loginOrSignup() async {
    emit(
      LoginState(
        email: state.email,
        password: state.password,
        confirm: state.confirm,
        loginOrSignUp: state.loginOrSignUp,
        loading: true,
      ),
    );

    if (state.loginOrSignUp == LoginOrSignUp.login) {
      await _login();
    } else {
      await _signUp();
    }
  }

  Future<void> _login() async {
    try {
      await supabase.auth.signInWithPassword(
        password: state.password,
        email: state.email,
      );
    } on AuthApiException catch (e) {
      emit(
        LoginState(
          email: state.email,
          password: state.password,
          confirm: state.confirm,
          loginOrSignUp: state.loginOrSignUp,
          error: 'Could not login: ${e.message}',
        ),
      );
    }
  }

  Future<void> _signUp() async {
    if (state.confirm == state.password) {
      try {
        await supabase.auth.signUp(
          password: state.password,
          email: state.email,
        );
      } on AuthException catch (e) {
        emit(
          LoginState(
            email: state.email,
            password: state.password,
            confirm: state.confirm,
            loginOrSignUp: state.loginOrSignUp,
            error: 'Could not sign up: ${e.message}',
          ),
        );
      }
    } else {
      emit(
        LoginState(
          email: state.email,
          password: state.password,
          confirm: state.confirm,
          loginOrSignUp: LoginOrSignUp.login,
        ),
      );
    }
  }

  void toggleLoginOrSignUp() {
    final next = state.loginOrSignUp == LoginOrSignUp.login
        ? LoginOrSignUp.signup
        : LoginOrSignUp.login;
    emit(
      LoginState(
        email: state.email,
        password: state.password,
        confirm: next == LoginOrSignUp.login ? '' : state.confirm,
        loginOrSignUp: next,
      ),
    );
  }
}
