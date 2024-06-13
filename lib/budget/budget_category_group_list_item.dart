import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class BudgetCategoryGroupListItem extends StatelessWidget {
  const BudgetCategoryGroupListItem({
    required this.groupExpanded,
    required this.selected,
    required this.name,
    required this.assigned,
    required this.activity,
    required this.available,
    required this.onCheckboxChanged,
    required this.onExpandedPressed,
    this.categories = const [],
    super.key,
  });

  final bool? groupExpanded;
  final bool selected;
  final String name;
  final String assigned;
  final String activity;
  final String available;
  final ValueChanged<bool?>? onCheckboxChanged;
  final VoidCallback? onExpandedPressed;
  final List<Widget> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: groupExpanded != null
                ? Theme.of(context).colorScheme.secondaryContainer
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Visibility.maintain(
                        visible: groupExpanded != null,
                        child: IconButton(
                          onPressed: onExpandedPressed,
                          icon: Transform.rotate(
                            angle: (groupExpanded ?? false) ? pi / 2 : 0,
                            child: const Icon(Icons.chevron_right),
                          ),
                        ),
                      ),
                      Checkbox(value: selected, onChanged: onCheckboxChanged),
                      Text(name),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          assigned,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          activity,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          available,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gutter(),
              ],
            ),
          ),
        ),
        const Divider(),
        if (groupExpanded case == true) ...categories,
      ],
    );
  }
}
