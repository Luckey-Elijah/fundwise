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
        Expanded(
          child: Row(
            children: [
              Expanded(child: BudgetActionsAndListView()),
              VerticalDivider(width: 1),
              BudgetSideBar(),
            ],
          ),
        ),
      ],
    );
  }
}

class BudgetActionsAndListView extends StatelessWidget {
  const BudgetActionsAndListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: SizedBox(
              height: 36,
              child: BudgetListViewActions(),
            ),
          ),
        ),
        Divider(),
        Expanded(child: BudgetListViewContent()),
      ],
    );
  }
}

class BudgetListViewContent extends StatelessWidget {
  const BudgetListViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      padding: EdgeInsets.zero,
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.chevron_right),
                            ),
                            Checkbox(value: false, onChanged: (_) {}),
                            const Text('CATEGORY'),
                          ],
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'ASSIGNED',
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'ACTIVITY',
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'AVAILABLE',
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
                const Divider(),
              ],
            );
          }

          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.chevron_right),
                              ),
                              Checkbox(value: false, onChanged: (_) {}),
                              Flexible(
                                child: Text(
                                  'Category Group #$index',
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  r'$0.00',
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  r'$0.00',
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  r'$0.00',
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
                ],
              ),
              const Divider(),
            ],
          );
        },
        childCount: 8,
      ),
    );
  }
}

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

class BudgetSideBar extends StatelessWidget {
  const BudgetSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(const Size.fromWidth(450)),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(
                child: Card.outlined(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(),
                  ),
                ),
              ),
              const Gutter(),
            ],
          ),
        ),
      ),
    );
  }
}

class BudgetTopNavigator extends StatelessWidget {
  const BudgetTopNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            GutterSmall(),
            BudgetMonthNavigator(),
            Gutter(),
            Padding(
              padding: EdgeInsets.all(8),
              child: BudgetReadyToAssign(),
            ),
            Gutter(),
            BudgetAgeOfMoneyLabel(),
          ],
        ),
        Flexible(
          child: SizedBox(
            height: 48,
            child: BudgetFilterListView(),
          ),
        ),
      ],
    );
  }
}

class BudgetAgeOfMoneyLabel extends StatelessWidget {
  const BudgetAgeOfMoneyLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '81 days',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          'Age of Money',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ],
    );
  }
}

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
              child: Text(
                'Enter a note...',
                style: Theme.of(context).textTheme.bodySmall,
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

class BudgetReadyToAssign extends StatelessWidget {
  const BudgetReadyToAssign({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Row(
        children: [
          const Gutter(),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    r'$4,527.18',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Ready to assign',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ),
          const Gutter(),
          TextButton.icon(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              foregroundColor:
                  Theme.of(context).colorScheme.onTertiaryContainer,
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            iconAlignment: IconAlignment.end,
            label: const Text('Assign'),
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () {},
          ),
          const Gutter(),
        ],
      ),
    );
  }
}

class BudgetFilterListView extends StatelessWidget {
  const BudgetFilterListView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        RawChip(
          onPressed: () {},
          label: const Text(
            'All',
          ),
          backgroundColor: colorScheme.secondaryContainer,
        ),
        const GutterSmall(),
        RawChip(
          onPressed: () {},
          label: const Text('Overspent'),
          backgroundColor: colorScheme.errorContainer,
        ),
        const GutterSmall(),
        RawChip(
          onPressed: () {},
          label: const Text('Overspent'),
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
