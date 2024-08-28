import 'dart:developer';

import 'package:flutter/foundation.dart' show FlutterError, kDebugMode;
import 'package:pocketbase/pocketbase.dart';

late final LoggingStore logging$;

class LoggingStore {
  LoggingStore({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;
  var _sequence = 0;

  Future<void> logException({
    required Object? exception,
    required StackTrace? stackTrace,
  }) async {
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
            'stack': '$stackTrace',
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
      log('$stackTrace', name: 'stackTrace');
    } catch (e, st) {
      log('Could not log an [exception]:');
      log('$exception', name: 'exception');
      log('$stackTrace', name: 'stackTrace');
      log('Due to another unknown thrown Object:');
      log('$e');
      log('$st');
    }
  }
}
