import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';

class ReportsLocation extends Location {
  @override
  LocationBuilder? get builder => (_) => Center(child: Placeholder());

  @override
  String get path => 'reports/';
}
