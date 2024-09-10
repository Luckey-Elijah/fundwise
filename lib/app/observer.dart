// ignore_for_file: strict_raw_type

import 'package:app/repository/logging_store.dart';
import 'package:bloc/bloc.dart';

class FundwiseBlocObserver extends BlocObserver {
  FundwiseBlocObserver({required LoggingStore loggingStore})
      : _loggingStore = loggingStore;

  final LoggingStore _loggingStore; // ignore: unused_field

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}
