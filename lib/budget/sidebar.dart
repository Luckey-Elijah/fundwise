import 'dart:async';
import 'dart:math';

import 'package:app/budget/budget_page.dart';
import 'package:app/components/expanded_state.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:mix/mix.dart';

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
      trailing: const Tooltip(
        message: r'$901,123.09',
        child: Text(
          r'$901,901',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      title: const Text(
        'Available in Jun',
        overflow: TextOverflow.clip,
        maxLines: 1,
      ),
      content: Column(
        children: [
          SidebarInspectionRow(label: 'Left Over from Last Month', amount: r()),
          const GutterTiny(),
          SidebarInspectionRow(label: 'Assigned in June', amount: r()),
          const GutterTiny(),
          SidebarInspectionRow(label: 'Activity', amount: r()),
        ],
      ),
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
      content: Column(
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
      ),
    );
  }
}

class BudgetSidebarInspector extends StatefulWidget {
  const BudgetSidebarInspector({
    required this.title,
    required this.content,
    this.trailing,
    super.key,
  });

  final Widget title;
  final Widget? trailing;
  final Widget content;

  @override
  State<BudgetSidebarInspector> createState() => _BudgetSidebarInspectorState();
}

class _BudgetSidebarInspectorState extends State<BudgetSidebarInspector>
    with ExpandedState {
  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $box.color(context.primaryContainer),
        $box.borderRadius(8),
      ),
      child: Column(
        children: [
          PressableBox(
            style: Style(
              $box.borderRadius(8),
              $box.color(context.primaryContainer),
              $box.padding(16),
              $on.hover($box.color.lighten(5)),
            ),
            onPress: () => expanded = !expanded,
            child: Row(
              children: [
                widget.title,
                const GutterTiny(),
                Transform.rotate(
                  angle: expanded ? pi / 2 : 0,
                  child: const Icon(Icons.chevron_right),
                ),
                if (widget.trailing != null) ...[
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: widget.trailing,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (expanded) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: widget.content,
            ),
          ],
        ],
      ),
    );
  }
}

class ListStreamProcessing<T> {
  final _controller = StreamController<List<T>>();

  void add(List<T> data) {
    _controller.add(data);
  }

  T? _latest;

  Stream<T> get _stream async* {
    if (_latest != null) yield _latest!;
    await for (final list in _controller.stream) {
      for (final element in list) {
        yield element;
        _latest = element;
      }
    }
  }

  Stream<T> get stream => _stream.asBroadcastStream();
}
