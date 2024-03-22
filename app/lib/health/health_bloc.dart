import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';

class HealthState {
  const HealthState({
    required this.url,
    this.code,
    this.data,
    this.message,
    this.error,
    this.shouldShow = false,
  });

  HealthState.fromHealthCheck(HealthCheck healthCheck, Uri url)
      : this(
          url: url,
          code: healthCheck.code,
          data: healthCheck.data,
          message: healthCheck.message,
        );

  final bool shouldShow;
  final int? code;
  final Map<String, dynamic>? data;
  final String? message;
  final String? error;
  final Uri url;
}

class HealthBloc extends Bloc<void, HealthState> {
  HealthBloc({required PocketBase pocketbase})
      : _pb = pocketbase,
        super(HealthState(url: Uri.parse(pocketbase.baseUrl))) {
    on<void>(_onCheckHealth);
  }

  Future<void> _onCheckHealth(
    void event,
    Emitter<HealthState> emit,
  ) async {
    try {
      final healthCheck = await _pb.health.check();
      if (healthCheck.code case < 200 && > 299) {
        return emit(
          HealthState(
            code: healthCheck.code,
            data: healthCheck.data,
            error: healthCheck.message,
            url: state.url,
          ),
        );
      }

      return emit(HealthState.fromHealthCheck(healthCheck, state.url));
    } on ClientException catch (e) {
      addError(e);
      // probably some connectivity error
      return emit(
        HealthState(
          error: 'url: <${e.url?.authority}> is not online.',
          url: state.url,
        ),
      );
    } on Exception catch (e) {
      addError(e);
      return emit(
        HealthState(
          error: '$e',
          url: state.url,
        ),
      );
    }
  }

  final PocketBase _pb;
}
