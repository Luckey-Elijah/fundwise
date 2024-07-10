import 'dart:math' show Random;

import 'package:app/budget/ui/category_group_list_item.dart';
import 'package:app/budget/ui/list_view_actions.dart';
import 'package:app/budget/ui/sidebar.dart';
import 'package:app/budget/ui/top_navigator.dart';
import 'package:app/budget_select/budget_select.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BudgetSelectPage();
  }
}

class BudgetReady extends StatelessWidget {
  const BudgetReady({required this.id, super.key});

  final String id;

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

class BudgetListViewContent extends StatefulWidget {
  const BudgetListViewContent({super.key});

  @override
  State<BudgetListViewContent> createState() => _BudgetListViewContentState();
}

class _BudgetListViewContentState extends State<BudgetListViewContent> {
  final List<BudgetCategoryGroupListItemData> categoryGroups = [
    for (var i = 0; i < rand.nextInt(4) + 4; i++)
      BudgetCategoryGroupListItemData(
        expanded: rand.nextBool(),
        name: 'Group #$i ',
        assigned: r(),
        activity: r(),
        available: r(),
        categories: [
          for (var i = 0; i < rand.nextInt(4) + 1; i++)
            BudgetCategoryListItemData(
              selected: false,
              name: 'Category #$i ',
              assigned: r(),
              activity: r(),
              available: r(),
            ),
        ],
      )..selected = rand.nextBool(),
  ];

  bool get allCategoriesSelected =>
      categoryGroups.every((group) => group.selected);
  bool get allGroupsExpanded => categoryGroups.every((group) => group.expanded);
  bool get anyGroupExpanded => categoryGroups.any((group) => group.expanded);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextStyle(
          style: context.h1.wide.thin.lg.orDefault(),
          child: BudgetCategoryGroupListItem(
            groupExpanded: allGroupsExpanded,
            selected: allCategoriesSelected,
            name: 'CATEGORY',
            assigned: 'ASSIGNED',
            activity: 'ACTIVITY',
            available: 'AVAILABLE',
            onCheckboxChanged: (value) {
              for (final group in categoryGroups) {
                setState(() => group.selected = value ?? !group.selected);
              }
            },
            onExpandedPressed: () {
              final allExpanded = allGroupsExpanded;
              for (final group in categoryGroups) {
                setState(() => group.expanded = !allExpanded);
              }
            },
          ),
        ),
        Expanded(
          child: ListView.custom(
            padding: EdgeInsets.zero,
            childrenDelegate: SliverChildBuilderDelegate(
              (context, groupIndex) {
                final group = categoryGroups[groupIndex];
                return BudgetCategoryGroupListItem(
                  groupExpanded: group.expanded,
                  selected: group.selected,
                  name: group.name,
                  assigned: group.assigned,
                  activity: group.activity,
                  available: group.available,
                  onCheckboxChanged: (value) {
                    setState(() => group.selected = value ?? !group.selected);
                  },
                  onExpandedPressed: () {
                    setState(() => group.expanded = !group.expanded);
                  },
                  categories: [
                    for (final category in group.categories)
                      BudgetCategoryGroupListItem(
                        groupExpanded: null,
                        selected: category.selected,
                        name: category.name,
                        assigned: category.assigned,
                        activity: category.activity,
                        available: category.available,
                        onCheckboxChanged: (value) {
                          setState(() {
                            category.selected = value ?? !category.selected;
                          });
                        },
                        onExpandedPressed: null,
                      ),
                  ],
                );
              },
              childCount: categoryGroups.length,
            ),
          ),
        ),
      ],
    );
  }
}

class BudgetCategoryGroupListItemData {
  BudgetCategoryGroupListItemData({
    required this.categories,
    required this.expanded,
    required this.name,
    required this.assigned,
    required this.activity,
    required this.available,
  });

  bool get selected => categories.every((category) => category.selected);
  set selected(bool value) {
    for (final category in categories) {
      category.selected = value;
    }
  }

  bool expanded;
  String name;
  String assigned;
  String activity;
  String available;
  List<BudgetCategoryListItemData> categories;
}

class BudgetCategoryListItemData {
  BudgetCategoryListItemData({
    required this.selected,
    required this.name,
    required this.assigned,
    required this.activity,
    required this.available,
  });

  bool selected;
  String name;
  String assigned;
  String activity;
  String available;
}
