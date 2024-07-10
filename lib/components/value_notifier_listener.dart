import 'package:flutter/material.dart';

mixin ValueNotifierListener<Value, Notifier extends ValueNotifier<Value>,
    T extends StatefulWidget> on State<T> {
  late Value _value = notifier.value;
  Notifier get notifier;

  void listen(Value previous, Value next);
  void _listener() => listen(_value, _value = notifier.value);

  @override
  void initState() {
    super.initState();
    notifier.addListener(_listener);
  }

  @override
  void dispose() {
    notifier.removeListener(_listener);
    super.dispose();
  }
}
