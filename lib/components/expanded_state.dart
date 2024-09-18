import 'package:flutter/material.dart';

mixin ExpandedState<T extends StatefulWidget> on State<T> {
  bool _expanded = false;

  bool get expanded => _expanded;

  set expanded(bool value) {
    setState(() {
      _expanded = value;
    });
  }
}
