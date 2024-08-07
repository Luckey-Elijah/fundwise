import 'dart:async';

import 'package:stream_transform/stream_transform.dart';

final date$ = DateStore();

class DateStore {
  var _now = _dateOnly(DateTime.now());

  static DateTime _dateOnly(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);

  bool _dateEquals(DateTime previous, DateTime next) {
    return previous.year == next.year &&
        previous.month == next.month &&
        previous.day == next.day;
  }

  Stream<DateTime> get stream async* {
    yield _now;

    const five = Duration(seconds: 5);

    yield* Stream<Duration>.periodic(five, (_) => five)
        .scan(_now, (date, duration) => _now = _dateOnly(DateTime.now()))
        .distinct(_dateEquals)
        .asBroadcastStream();
  }
}
