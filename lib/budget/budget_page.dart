import 'dart:math' show Random;

import 'package:app/budget/budget_category_group_list_item.dart';
import 'package:app/budget/budget_list_view_actions.dart';
import 'package:app/budget/budget_sidebar.dart';
import 'package:app/budget/budget_top_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BudgetTopNavigator(),
        GutterSmall(),
        Divider(),
        Expanded(child: BudgetContentBuilder()),
      ],
    );
  }
}

class BudgetContentBuilder extends StatefulWidget {
  const BudgetContentBuilder({super.key});

  @override
  State<BudgetContentBuilder> createState() => _BudgetContentBuilderState();
}

class _BudgetContentBuilderState extends State<BudgetContentBuilder> {
  bool showSideBar = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final large = constraints.maxWidth > 1200;
        return Stack(
          children: [
            Row(
              children: [
                const Expanded(
                  flex: 3,
                  child: BudgetActionsAndListView(),
                ),
                if (large) ...[
                  const VerticalDivider(width: 1),
                  const Flexible(child: BudgetSidebar()),
                ],
              ],
            ),
            if (!large) ...[
              Align(
                alignment: Alignment.centerRight,
                child: AnimatedSlide(
                  duration: Durations.short2,
                  offset: showSideBar ? Offset.zero : Offset.fromDirection(0),
                  child: Material(
                    elevation: 10,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 420),
                      child: const BudgetSidebar(),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: IconButton.filled(
                    icon: showSideBar
                        ? const Icon(Icons.chevron_right)
                        : const Icon(Icons.chevron_left),
                    onPressed: () => setState(() => showSideBar = !showSideBar),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class BudgetActionsAndListView extends StatelessWidget {
  const BudgetActionsAndListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: 36,
            child: BudgetListViewActions(),
          ),
        ),
        Divider(),
        Expanded(
          child: BudgetListViewContent(),
        ),
      ],
    );
  }
}

final rand = Random();
String r() => r'$'
    '${rand.nextInt(1200)}'
    '.'
    '${rand.nextInt(100).toString().padLeft(2, '0')}';

class BudgetListViewContent extends StatelessWidget {
  const BudgetListViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BudgetCategoryGroupListItem(
          expanded: false,
          selected: false,
          name: 'CATEGORY',
          assigned: 'ASSIGNED',
          activity: 'ACTIVITY',
          available: 'AVAILABLE',
          onCheckboxChanged: (value) {},
          onExpandedPressed: () {},
        ),
        Expanded(
          child: ListView.custom(
            padding: EdgeInsets.zero,
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) {
                return BudgetCategoryGroupListItem(
                  expanded: false,
                  selected: false,
                  name: 'Group #$index ',
                  assigned: r(),
                  activity: r(),
                  available: r(),
                  onCheckboxChanged: (value) {},
                  onExpandedPressed: () {},
                );
              },
              childCount: 8,
            ),
          ),
        ),
      ],
    );
  }
}
