import 'package:flutter/material.dart';

class BudgetListViewActions extends StatelessWidget {
  const BudgetListViewActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        TextButton.icon(
          onPressed: () {},
          label: const Text('Category group'),
          icon: const Icon(Icons.add),
        ),
        TextButton.icon(
          onPressed: () {},
          label: const Text('Undo'),
          icon: const Icon(Icons.undo),
        ),
        TextButton.icon(
          onPressed: () {},
          label: const Text('Redo'),
          icon: const Icon(Icons.redo),
        ),
        TextButton.icon(
          onPressed: () {},
          label: const Text(
            'Recent Moves',
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
          icon: const Icon(Icons.history),
        ),
        SegmentedButton<bool>(
          emptySelectionAllowed: true,
          onSelectionChanged: (seection) {},
          selected: const {},
          segments: const [
            ButtonSegment(
              value: true,
              icon: Icon(Icons.density_medium),
            ),
            ButtonSegment(
              value: true,
              icon: Icon(Icons.density_small),
            ),
          ],
        ),
      ],
    );
  }
}
