import 'dart:async';

import 'package:stream_transform/stream_transform.dart';

class DateRepository {
  var _now = _dateOnly(DateTime.now());

  static DateTime _dateOnly(DateTime dateTime) =>
      DateTime(dateTime.year, dateTime.month, dateTime.day);

  bool _dateEquals(DateTime previous, DateTime next) {
    return previous.year == next.year &&
        previous.month == next.month &&
        previous.day == next.day;
  }

  Stream<DateTime> _buildStream() async* {
    yield _now;

    const five = Duration(seconds: 5);

    yield* Stream<Duration>.periodic(five, (_) => five)
        .scan(_now, (date, duration) => _now = _dateOnly(DateTime.now()))
        .distinct(_dateEquals)
        .asBroadcastStream();
  }

  late final _stream = _buildStream().asBroadcastStream();

  Stream<DateTime> get stream => _stream;
}
