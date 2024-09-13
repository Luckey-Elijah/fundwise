import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class BudgetFilterListView extends StatelessWidget {
  const BudgetFilterListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        RawChip(
          onPressed: () {},
          label: const Text(
            'All',
          ),
          backgroundColor: context.secondaryContainer,
        ),
        const GutterSmall(),
        RawChip(
          onPressed: () {},
          label: const Text('Overspent'),
          backgroundColor: context.errorContainer,
        ),
        const GutterSmall(),
        RawChip(
          onPressed: () {},
          label: const Text('Snoozed'),
        ),
        const GutterSmall(),
        RawChip(
          onPressed: () {},
          label: const Text('Underfunded'),
        ),
        const GutterSmall(),
        RawChip(
          onPressed: () {},
          label: const Text('Overfunded'),
        ),
        const GutterSmall(),
        RawChip(
          onPressed: () {},
          label: const Text('Money Available'),
        ),
        const GutterSmall(),
        IconButton.outlined(
          tooltip: 'View Menu',
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
        ),
      ],
    );
  }
}
