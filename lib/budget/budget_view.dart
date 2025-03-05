import 'package:flutter/widgets.dart';
import 'package:fundwise/budget/budget_model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({required this.budget, super.key});

  final BudgetModel budget;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(children: [Text(budget.name, style: theme.textTheme.large), Placeholder()]);
  }
}
