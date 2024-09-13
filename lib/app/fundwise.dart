import 'package:app/authentication/authentication.dart';
import 'package:app/current_location/current_location.dart';
import 'package:app/login/login.dart';
import 'package:app/repository/repository.dart';
import 'package:app/router/router.dart';
import 'package:app/splash/splash.dart';
import 'package:app/startup/startup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mix/mix.dart';

class FundwiseApp extends StatefulWidget {
  const FundwiseApp({
    required this.authentication,
    super.key,
  });

  final AuthenticationRepository authentication;

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
        CurrentLocationInterceptor(add: (l) => currentLocationCubit.add(l)),
        LoggingLocationInterceptor(),
        AuthenticationLocationInterceptor(widget.authentication),
        LoginLocationInterceptor(widget.authentication),
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
            if (state is LoadingStartUpState) return const Splash();

            return MixTheme(
              data: MixThemeData.withMaterial(),
              child: CurrentLocationProvider(
                currentLocationCubit: currentLocationCubit,
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
