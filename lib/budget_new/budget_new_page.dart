import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:fundwise/budget_new/budget_new_view.dart';

@RoutePage()
class BudgetNewPage extends StatelessWidget {
  const BudgetNewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BudgetNewView();
  }
}
