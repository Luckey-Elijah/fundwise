import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';

late final LoggingStore logging$;

class LoggingStore {
  LoggingStore({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;
  late final _col = _pb.collection('errors');
  var _sequence = 0;
  Future<void> logException({
    required Object? exception,
    required StackTrace? stackTrace,
  }) async {
    try {
      if (exception! is FlutterError) {
        final record = await _col.create(
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
          name: 'pb.errors',
          sequenceNumber: _sequence++,
        );
      }
      debugPrint('$exception');
      debugPrint('$stackTrace');
    } on Exception catch (e, st) {
      debugPrint('Could not log an [exception]:');
      debugPrint('$exception');
      debugPrint('$stackTrace');
      debugPrint('Due to another exception:');
      debugPrint('$e');
      debugPrint('$st');
    } catch (e, st) {
      debugPrint('Could not log an [exception]:');
      debugPrint('$exception');
      debugPrint('$stackTrace');
      debugPrint('Due to another unknown thrown Object:');
      debugPrint('$e');
      debugPrint('$st');
    }
  }
}
