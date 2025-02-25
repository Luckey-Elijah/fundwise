import 'package:duck_router/duck_router.dart';
import 'package:fundwise/budget/budget_page.dart';

class BudgetLocation extends Location {
  @override
  LocationBuilder? get builder => (_) => BudgetPage();

  @override
  String get path => 'budget/';
}
