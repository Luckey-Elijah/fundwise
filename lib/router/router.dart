import 'package:app/authentication/authentication.dart';
import 'package:app/current_location/current_location.dart';
import 'package:app/login/login.dart';
import 'package:app/repository/repository.dart';
import 'package:app/splash/splash.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';

export 'package:duck_router/duck_router.dart';

DuckRouter duckRouter({
  required AuthenticationRepository Function() authentication,
  required CurrentLocationCubit Function() currentLocationCubit,
}) {
  return DuckRouter(
    initialLocation: SplashLocation(),
    interceptors: [
      CurrentLocationInterceptor(add: (l) => currentLocationCubit().add(l)),
      AuthenticationLocationInterceptor(authentication()),
      LoginLocationInterceptor(authentication()),
    ],
  );
}

extension DuckRouterOnBuildContext on BuildContext {
  DuckRouter get router => DuckRouter.of(this);

  Future<T?> Function<T extends Object?>({
    required Location to,
    bool? clearStack,
    bool? replace,
    bool root,
  }) get navigate => router.navigate;
}
