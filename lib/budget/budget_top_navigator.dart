import 'package:app/budget/budget_age_of_money_label.dart';
import 'package:app/budget/budget_filter_list_view.dart';
import 'package:app/budget/budget_month_navigator.dart';
import 'package:app/budget/budget_ready_to_assign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class BudgetTopNavigator extends StatelessWidget {
  const BudgetTopNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            GutterSmall(),
            BudgetMonthNavigator(),
            Gutter(),
            Padding(
              padding: EdgeInsets.all(8),
              child: BudgetReadyToAssign(),
            ),
            Gutter(),
            BudgetAgeOfMoneyLabel(),
          ],
        ),
        SizedBox(
          height: 48,
          child: BudgetFilterListView(),
        ),
      ],
    );
  }
}
