import 'package:app/account/account_location.dart';
import 'package:app/budget/budget_location.dart';
import 'package:app/home/home_page.dart';
import 'package:app/reports/reports_location.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';

class HomeLocation extends StatefulLocation {
  @override
  StatefulLocationBuilder get childBuilder => _childBuilder;

  Widget _childBuilder(BuildContext context, DuckShell shell) {
    return HomePage(shell: shell);
  }

  @override
  List<Location> get children => [
    BudgetLocation(),
    ReportsLocation(),
    AccountLocation(),
  ];

  @override
  String get path => '';
}
