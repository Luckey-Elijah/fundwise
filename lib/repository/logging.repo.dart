import 'package:flutter/foundation.dart';
import 'package:pocketbase/pocketbase.dart';

class LoggingRepository {
  LoggingRepository({required PocketBase pb}) : _pb = pb;

  final PocketBase _pb;
  late final _col = _pb.collection('errors');

  Future<void> logException({
    required Object? exception,
    required StackTrace? stackTrace,
  }) async {
    try {
      final record = await _col.create(
        body: {
          'reporter': switch (_pb.authStore.model) {
            final RecordModel model => model.id,
            final AdminModel model => model.id,
            _ => null,
          },
          'error': '$exception',
          'stack': '$stackTrace',
          'debug': kDebugMode,
        },
      );
      debugPrint('successfully logged: ${record.id}');
    } on Exception catch (e, st) {
      debugPrint('Could not log an exception:');
      debugPrint('$exception');
      debugPrint('$stackTrace');
      debugPrint('Due to another exception:');
      debugPrint('$e');
      debugPrint('$st');
    }
  }
}
