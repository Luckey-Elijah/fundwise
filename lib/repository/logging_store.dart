import 'dart:developer';

import 'package:flutter/foundation.dart' show FlutterError, kDebugMode;
import 'package:pocketbase/pocketbase.dart';
import 'package:stack_trace/stack_trace.dart';

class LoggingStore {
  LoggingStore({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;
  var _sequence = 0;

  Future<void> logException({
    required Object? exception,
    required StackTrace? stackTrace,
  }) async {
    String? trace;
    if (stackTrace != null) trace = Trace.format(stackTrace);
    try {
      if (exception is! FlutterError) {
        final record = await _pb.collection('errors').create(
          body: {
            'reporter': switch (_pb.authStore.model) {
              final RecordModel model => model.id,
              final AdminModel model => model.id,
              _ => null,
            },
            'runtime_type': '${exception.runtimeType}',
            'error': '$exception',
            'stack': trace,
            'debug': kDebugMode,
          },
        );

        log(
          'successfully logged: ${record.id}',
          time: DateTime.now(),
          error: exception,
          name: 'pb.errors ${_sequence.toString().padLeft(4, '0')}',
          sequenceNumber: _sequence++,
        );
      }
      log('$exception', name: 'exception');
      log('$trace', name: 'trace');
    } catch (e, st) {
      log('Could not log an [exception]:');
      log('$exception', name: 'exception');
      log('$trace', name: 'trace');
      log('Due to another unknown thrown Object:');
      log('$e');
      log('$st');
    }
  }
}
