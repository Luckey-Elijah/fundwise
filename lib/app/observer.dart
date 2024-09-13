import 'package:app/repository/repository.dart';
import 'package:bloc/bloc.dart';

class FundwiseBlocObserver extends BlocObserver {
  FundwiseBlocObserver({
    required LoggingRepository loggingStore,
  }) : _loggingStore = loggingStore;

  final LoggingRepository _loggingStore;

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
}
