import 'package:app/splash/splash.dart';
import 'package:duck_router/duck_router.dart';

class SplashLocation extends Location {
  @override
  LocationBuilder? get builder => (_) => const Splash();

  @override
  String get path => '/splash';
}
