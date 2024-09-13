import 'package:app/repository/auth_store.dart';
import 'package:app/router/router.dart';
import 'package:app/splash/splash_location.dart';
import 'package:duck_router/duck_router.dart';

class AuthenticationLocationInterceptor extends LocationInterceptor {
  AuthenticationLocationInterceptor(this.auth);

  final AuthenticationStore auth;

  @override
  Location? execute(Location to, Location? from) {
    if (auth.user == null) return LoginLocation();
    if (to is SplashLocation) return HomeLocation();
    return null;
  }
}
