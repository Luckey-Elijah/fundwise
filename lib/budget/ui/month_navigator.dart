import 'package:flutter/material.dart';

class BudgetMonthNavigator extends StatelessWidget {
  const BudgetMonthNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton.outlined(
          iconSize: 32,
          onPressed: () {},
          icon: const Icon(Icons.chevron_left),
        ),
        Column(
          children: [
            TextButton.icon(
              onPressed: () {},
              iconAlignment: IconAlignment.end,
              icon: const Icon(Icons.arrow_drop_down),
              label: Text(
                'Jun 2024',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  'Enter a note...',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          ],
        ),
        IconButton.outlined(
          iconSize: 32,
          onPressed: () {},
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
