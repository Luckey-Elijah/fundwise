import 'package:app/repository/auth_store.dart';
import 'package:app/router/router.dart';
import 'package:duck_router/duck_router.dart';

class LoginLocationInterceptor extends LocationInterceptor {
  LoginLocationInterceptor(this.auth);

  final AuthenticationStore auth;

  @override
  Location? execute(Location to, Location? from) {
    if (from is LoginLocation && to is! LoginLocation && auth.user == null) {
      return LoginLocation();
    }
    return null;
  }
}
