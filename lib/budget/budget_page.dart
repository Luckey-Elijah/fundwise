import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/budget/budget_controller.dart';
import 'package:fundwise/budget/budget_model.dart';
import 'package:fundwise/budget/budget_view.dart';
import 'package:fundwise/budget/new_budget_view.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class BudgetPage extends ConsumerWidget {
  const BudgetPage({@PathParam('id') this.id, super.key});

  final String? id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(budgetControllerProvider(id));

    if (state case AsyncData(:final value)) {
      return switch (value) {
        EmptyBudgetModel() => NewBudgetView(),
        BudgetModel() => BudgetView(budget: value),
      };
    }

    return Center(child: SizedBox(width: 100, child: ShadProgress()));
  }
}
