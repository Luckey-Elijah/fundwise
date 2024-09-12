import 'package:app/app/animated_splash.dart';
import 'package:app/auth/authentication_navigation.dart';
import 'package:app/current_location/current_location.dart';
import 'package:app/repository/auth_store.dart';
import 'package:app/router/router.dart';
import 'package:app/startup/startup_bloc.dart';
import 'package:app/startup/startup_state.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/mix.dart';

class FundwiseApp extends StatefulWidget {
  const FundwiseApp({
    required this.authentication,
    super.key,
  });

  final AuthenticationStore authentication;

  @override
  State<FundwiseApp> createState() => _FundwiseAppState();
}

class _FundwiseAppState extends State<FundwiseApp> {
  late final DuckRouter router;
  late final CurrentLocationCubit currentLocationCubit;

  @override
  void initState() {
    router = DuckRouter(
      initialLocation: SplashLocation(),
      interceptors: [
        LoggingLocationInterceptor(),
        AuthenticationLocationInterceptor(widget.authentication),
        LoginLocationInterceptor(widget.authentication),
        CurrentLocationInterceptor(
          add: (value) => currentLocationCubit.add(value),
        ),
      ],
    );

    currentLocationCubit = CurrentLocationCubit(router: router);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StartUpBloc, StartUpState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: router,
          builder: (context, child) {
            if (state is LoadingStartUpState) return const AnimatedSplash();
            return MixTheme(
              data: MixThemeData.withMaterial(),
              child: AuthenticationNavigation(
                onAuthenticated: () => router.navigate(
                  to: HomeLocation(),
                  replace: true,
                ),
                onNotAuthenticated: () => router.navigate(
                  to: LoginLocation(),
                  clearStack: true,
                  root: true,
                  replace: true,
                ),
                child: CurrentLocationProvider(
                  currentLocationCubit: currentLocationCubit,
                  child: child,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
