import 'package:bloc/bloc.dart';

class FundwiseBlocObserver extends BlocObserver {
  @override
  void onChange(
    BlocBase<Object?> bloc,
    Change<Object?> change,
  ) {
    super.onChange(bloc, change);
  }

  @override
  void onClose(
    BlocBase<Object?> bloc,
  ) {
    super.onClose(bloc);
  }

  @override
  void onCreate(
    BlocBase<Object?> bloc,
  ) {
    super.onCreate(bloc);
  }

  @override
  void onError(
    BlocBase<Object?> bloc,
    Object error,
    StackTrace stackTrace,
  ) {
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(
    Bloc<Object?, Object?> bloc,
    Object? event,
  ) {
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(
    Bloc<Object?, Object?> bloc,
    Transition<Object?, Object?> transition,
  ) {
    super.onTransition(bloc, transition);
  }
}
