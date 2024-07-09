import 'dart:math';

import 'package:app/budget/ui/budget_page.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class BudgetSidebar extends StatelessWidget {
  const BudgetSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        GutterTiny(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: AutoAssignInspector(),
        ),
        GutterSmall(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: BudgetAvailabilityInspector(),
        ),
      ],
    );
  }
}

class BudgetAvailabilityInspector extends StatelessWidget {
  const BudgetAvailabilityInspector({super.key});

  @override
  Widget build(BuildContext context) {
    return BudgetSidebarInspector(
      trailing: Text(r(), overflow: TextOverflow.clip),
      title: const Text(
        'Available in Jun',
        overflow: TextOverflow.clip,
      ),
      children: [
        SidebarInspectionRow(label: 'Left Over from Last Month', amount: r()),
        const GutterTiny(),
        SidebarInspectionRow(label: 'Assigned in June', amount: r()),
        const GutterTiny(),
        SidebarInspectionRow(label: 'Activity', amount: r()),
      ],
    );
  }
}

class SidebarInspectionRow extends StatelessWidget {
  const SidebarInspectionRow({
    required this.label,
    required this.amount,
    super.key,
  });

  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label)),
        const GutterTiny(),
        Text(amount),
      ],
    );
  }
}

class AutoAssignInspector extends StatelessWidget {
  const AutoAssignInspector({super.key});

  @override
  Widget build(BuildContext context) {
    return BudgetSidebarInspector(
      title: const Row(
        children: [
          Icon(Icons.bolt),
          GutterTiny(),
          Text('Auto-Assign'),
        ],
      ),
      children: [
        ElevatedButton(
          child: SidebarInspectionRow(
            label: 'Underfunded',
            amount: r(),
          ),
          onPressed: () {},
        ),
        const Gutter(),
        ElevatedButton(
          child: SidebarInspectionRow(
            label: 'Assign Last Month',
            amount: r(),
          ),
          onPressed: () {},
        ),
        const GutterTiny(),
        ElevatedButton(
          child: SidebarInspectionRow(
            label: 'Spent Last Month',
            amount: r(),
          ),
          onPressed: () {},
        ),
        const GutterTiny(),
        ElevatedButton(
          child: SidebarInspectionRow(
            label: 'Average Assigned',
            amount: r(),
          ),
          onPressed: () {},
        ),
        const GutterTiny(),
        ElevatedButton(
          child: SidebarInspectionRow(
            label: 'Average Spent',
            amount: r(),
          ),
          onPressed: () {},
        ),
        const Gutter(),
        ElevatedButton(
          child: SidebarInspectionRow(
            label: 'Reset Available Amounts',
            amount: r(),
          ),
          onPressed: () {},
        ),
        const GutterTiny(),
        ElevatedButton(
          child: SidebarInspectionRow(
            label: 'Reset Assigned Amounts',
            amount: r(),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class BudgetSidebarInspector extends StatefulWidget {
  const BudgetSidebarInspector({
    required this.title,
    required this.children,
    this.trailing,
    super.key,
  });

  final Widget title;
  final Widget? trailing;
  final List<Widget> children;

  @override
  State<BudgetSidebarInspector> createState() => _BudgetSidebarInspectorState();
}

class _BudgetSidebarInspectorState extends State<BudgetSidebarInspector> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: context.primaryContainer,
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => expanded = !expanded),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  widget.title,
                  const GutterTiny(),
                  Transform.rotate(
                    angle: expanded ? pi / 2 : 0,
                    child: const Icon(Icons.chevron_right),
                  ),
                  if (widget.trailing != null) ...[
                    const Spacer(),
                    widget.trailing!,
                  ],
                ],
              ),
            ),
          ),
          if (expanded) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ...widget.children,
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
