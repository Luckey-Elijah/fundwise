import 'package:app/reports/reports.dart';
import 'package:app/router/custom_pages.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';

class ReportsLocation extends Location {
  const ReportsLocation();
  @override
  LocationPageBuilder? get pageBuilder {
    return (context) => NoTransitionPage(
          name: path,
          child: _builder(context),
        );
  }

  Widget _builder(BuildContext context) => const ReportsPage();

  @override
  String get path => '/reports';
}
