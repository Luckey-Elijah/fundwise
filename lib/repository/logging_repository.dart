import 'dart:developer';

import 'package:flutter/foundation.dart' show FlutterError, kDebugMode;
import 'package:pocketbase/pocketbase.dart';
import 'package:stack_trace/stack_trace.dart';

class LoggingRepository {
  LoggingRepository({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;
  var _sequence = 0;

  Future<void> logException({
    required Object? exception,
    required StackTrace? stackTrace,
    Object? extra,
  }) async {
    String? trace;
    if (stackTrace != null) trace = Trace.format(stackTrace);
    try {
      if (exception is! FlutterError && !kDebugMode) {
        final record = await _pb.collection('errors').create(
          body: {
            'reporter': _pb.authStore.record?.id,
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
      if (extra != null) log('$extra', name: 'extra');
      // handling all other cases to log
      // ignore: avoid_catches_without_on_clauses
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
