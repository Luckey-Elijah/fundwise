import 'package:app/budget/budget_page.dart';
import 'package:app/router/custom_pages.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/widgets.dart';

class BudgetLocation extends Location {
  const BudgetLocation({this.id});

  final String? id;

  @override
  LocationPageBuilder? get pageBuilder {
    return (c) => NoTransitionPage(name: path, child: _builder(c));
  }

  Widget _builder(BuildContext context) {
    final id = this.id;
    if (id != null) return BudgetPage(id: id);
    return const BudgetLandingPage();
  }

  @override
  String get path => id == null ? '/budget' : '/budget/$id';
}
