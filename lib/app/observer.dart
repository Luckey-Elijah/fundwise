import 'dart:developer';

import 'package:app/repository/logging_store.dart';
import 'package:bloc/bloc.dart';

class FundwiseBlocObserver extends BlocObserver {
  FundwiseBlocObserver({
    required LoggingStore loggingStore,
  }) : _loggingStore = loggingStore;

  final LoggingStore _loggingStore;

  @override
  void onEvent(
    Bloc<dynamic, dynamic> bloc,
    Object? event,
  ) {
    if (event != null) {
      log('$event', name: 'BlocObserver | ${bloc.runtimeType} | onEvent');
    }
    super.onEvent(bloc, event);
  }

  @override
  void onError(
    BlocBase<dynamic> bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    super.onError(bloc, error, stackTrace);
    _loggingStore.logException(
      exception: error,
      stackTrace: stackTrace,
      extra: bloc.runtimeType,
    );
  }

  @override
  void onChange(
    BlocBase<dynamic> bloc,
    Change<dynamic> change,
  ) {
    log('$change', name: 'BlocObserver | ${bloc.runtimeType} | onChange');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    log(
      '$transition',
      name: 'BlocObserver | ${bloc.runtimeType} | onTransition',
    );
    super.onTransition(bloc, transition);
  }
}
