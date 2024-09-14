import 'package:app/budget_new/budget_new.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';

class BudgetNewPageLocation extends Location {
  const BudgetNewPageLocation();

  @override
  LocationBuilder? get builder => _builder;

  Widget _builder(BuildContext context) => const BudgetNewPage();

  @override
  String get path => '/budget/new';
}
