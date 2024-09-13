import 'package:app/repository/repository.dart';
import 'package:app/router/router.dart';

class LoginLocationInterceptor extends LocationInterceptor {
  LoginLocationInterceptor(this.auth);

  final AuthenticationRepository auth;

  @override
  Location? execute(Location to, Location? from) {
    if (from is LoginLocation && to is! LoginLocation && auth.user == null) {
      return LoginLocation();
    }
    return null;
  }
}
