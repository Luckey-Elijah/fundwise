import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentLocationCubit extends Cubit<Location> {
  CurrentLocationCubit({
    required DuckRouter router,
  }) : super(router.configuration.initialLocation);

  void add(Location location) => emit(location);
}

class CurrentLocationInterceptor extends LocationInterceptor {
  CurrentLocationInterceptor({required this.add, super.pushesOnTop});

  final ValueSetter<Location> add;

  @override
  Location? execute(Location to, Location? from) {
    add(to);
    return null;
  }
}

class CurrentLocationProvider extends StatelessWidget {
  const CurrentLocationProvider({
    required this.child,
    required this.currentLocationCubit,
    super.key,
  });

  final Widget? child;
  final CurrentLocationCubit currentLocationCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrentLocationCubit>.value(
      value: currentLocationCubit,
      child: child,
    );
  }
}
