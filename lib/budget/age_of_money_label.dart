import 'package:app/budget/budget_page.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';

class BudgetAgeOfMoneyLabel extends StatelessWidget {
  const BudgetAgeOfMoneyLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${rand.nextInt(30) + 1} days',
          style: context.h2.thin,
          maxLines: 1,
        ),
        Text(
          'Age of Money',
          style: context.h3.thin,
          maxLines: 2,
        ),
      ],
    );
  }
}
