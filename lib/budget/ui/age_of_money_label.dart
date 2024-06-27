import 'package:app/budget/ui/budget_page.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';

class BudgetAgeOfMoneyLabel extends StatelessWidget {
  const BudgetAgeOfMoneyLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${rand.nextInt(30) + 1} days', style: context.h1),
        Text('Age of Money', style: context.h2),
      ],
    );
  }
}
