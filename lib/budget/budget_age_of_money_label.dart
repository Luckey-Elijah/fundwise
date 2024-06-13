import 'package:app/budget/budget_page.dart';
import 'package:flutter/material.dart';

class BudgetAgeOfMoneyLabel extends StatelessWidget {
  const BudgetAgeOfMoneyLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${rand.nextInt(30) + 1} days',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          'Age of Money',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}
