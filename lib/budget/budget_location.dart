import 'package:app/budget/budget_page.dart';
import 'package:duck_router/duck_router.dart';

class BudgetLocation extends Location {
  @override
  LocationBuilder? get builder => (_) => BudgetPage();

  @override
  String get path => 'budget/';
}
