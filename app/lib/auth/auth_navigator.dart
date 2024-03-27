import 'package:app/auth/auth_bloc.dart';
import 'package:app/routes.dart' as app;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthNavigator extends BlocListener<AuthBloc, AuthState> {
  AuthNavigator({
    required NavigatorState? Function() navigatorState,
    super.key,
  }) : super(
          listenWhen: (prev, next) => prev != next,
          listener: _listener(navigatorState),
        );

  static BlocWidgetListener<AuthState> _listener(
    NavigatorState? Function() navigatorState,
  ) {
    return (BuildContext context, AuthState state) {
      final push = navigatorState()?.pushReplacementNamed;
      if (state == AuthState.authenticated) {
        push?.call(app.Routes.dashboard.path);
        return;
      }
      push?.call(app.Routes.initialRoute);
    };
  }
}
