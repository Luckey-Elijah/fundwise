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
    this.onAdd,
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
  final VoidCallback? onAdd;

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
                      const GutterTiny(),
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
                      if (onAdd != null) ...[
                        const GutterTiny(),
                        AddNewCategoryButton(onPressed: onAdd!),
                      ],
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

class AddNewCategoryButton extends StatefulWidget {
  const AddNewCategoryButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  State<AddNewCategoryButton> createState() => _AddNewCategoryButtonState();
}

class _AddNewCategoryButtonState extends State<AddNewCategoryButton> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => visible = true),
      onExit: (_) => setState(() => visible = false),
      child: Visibility.maintain(
        visible: visible,
        child: TextButton.icon(
          iconAlignment: IconAlignment.end,
          onPressed: widget.onPressed,
          label: const Text('Add New Category'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
