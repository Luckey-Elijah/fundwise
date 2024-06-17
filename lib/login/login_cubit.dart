import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

enum LoginOrSignUp { login, signup }

class LoginState {
  const LoginState({
    required this.email,
    required this.password,
    required this.confirm,
    required this.username,
    required this.loginOrSignUp,
    this.error,
    this.loading = false,
    this.signupSuccess,
  });

  static const initial = LoginState(
    email: '',
    password: '',
    username: '',
    confirm: '',
    loginOrSignUp: LoginOrSignUp.login,
  );

  final String email;
  final String password;
  final String confirm;
  final String username;
  final LoginOrSignUp loginOrSignUp;

  final String? error;
  final bool loading;
  final String? signupSuccess;
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.pocketBase,
  }) : super(LoginState.initial);

  final PocketBase pocketBase;

  void updateEmail(String email) {
    emit(
      LoginState(
        email: email,
        password: state.password,
        confirm: state.confirm,
        username: state.username,
        loginOrSignUp: state.loginOrSignUp,
      ),
    );
  }

  void updatePassword(String password) {
    emit(
      LoginState(
        password: password,
        username: state.username,
        confirm: state.confirm,
        loginOrSignUp: state.loginOrSignUp,
        email: state.email,
      ),
    );
  }

  void updateConfirm(String confirm) {
    emit(
      LoginState(
        username: state.username,
        confirm: confirm,
        password: state.password,
        loginOrSignUp: state.loginOrSignUp,
        email: state.email,
      ),
    );
  }

  void updateUsername(String username) {
    emit(
      LoginState(
        username: username,
        confirm: state.confirm,
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
        username: state.username,
        password: state.password,
        confirm: state.confirm,
        loginOrSignUp: state.loginOrSignUp,
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
      await pocketBase.collection('users').authWithPassword(
            state.email,
            state.password,
          );
    } on Exception catch (e) {
      emit(
        LoginState(
          email: state.email,
          username: state.username,
          password: state.password,
          confirm: state.confirm,
          loginOrSignUp: state.loginOrSignUp,
          error: 'Could not login: $e',
        ),
      );
    }
  }

  Future<void> _signUp() async {
    final invalidPass = (state.password.isEmpty || state.confirm.isEmpty) &&
        (state.confirm != state.password);
    if (invalidPass) {
      return emit(
        LoginState(
          email: state.email,
          username: state.username,
          password: state.password,
          confirm: state.confirm,
          error: 'provide matching password',
          loginOrSignUp: state.loginOrSignUp,
        ),
      );
    }

    if (state.email.isEmpty) {
      return emit(
        LoginState(
          email: state.email,
          username: state.username,
          password: state.password,
          confirm: state.confirm,
          error: 'provide a email',
          loginOrSignUp: state.loginOrSignUp,
        ),
      );
    }

    if (state.username.isEmpty) {
      return emit(
        LoginState(
          email: state.email,
          username: state.username,
          password: state.password,
          confirm: state.confirm,
          error: 'provide a username',
          loginOrSignUp: state.loginOrSignUp,
        ),
      );
    }

    try {
      // ignore: unused_local_variable
      final record = await pocketBase.collection('users').create(
        body: {
          'username': state.username,
          'email': state.email,
          'emailVisibility': true,
          'password': state.password,
          'passwordConfirm': state.confirm,
        },
      );

      emit(
        LoginState(
          email: state.email,
          username: state.username,
          password: state.password,
          confirm: state.confirm,
          loginOrSignUp: state.loginOrSignUp,
        ),
      );
    } on Exception catch (e) {
      emit(
        LoginState(
          email: state.email,
          username: state.username,
          password: state.password,
          confirm: state.confirm,
          loginOrSignUp: state.loginOrSignUp,
          error: 'Could not sign up: $e',
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
        username: state.username,
        password: state.password,
        confirm: next == LoginOrSignUp.login ? '' : state.confirm,
        loginOrSignUp: next,
      ),
    );
  }
}
