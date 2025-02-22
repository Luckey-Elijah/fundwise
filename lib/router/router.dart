import 'package:app/components/fundwise_divider.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

part 'router.g.dart';

class ShowOnHover extends StatefulWidget {
  const ShowOnHover({required this.child, required this.hidden, super.key});
  final Widget child;
  final Widget hidden;
  @override
  State<ShowOnHover> createState() => _ShowOnHoverState();
}

class _ShowOnHoverState extends State<ShowOnHover> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

@riverpod
DuckRouter router(Ref ref) => DuckRouter(initialLocation: HomeLocation());

class BudgetLocation extends Location {
  @override
  LocationBuilder? get builder => (_) => BudgetPage();

  @override
  String get path => 'budget/';
}

class TableExample extends StatefulWidget {
  const TableExample({super.key});

  @override
  State<TableExample> createState() => _TableExampleState();
}

class _TableExampleState extends State<TableExample> {
  final horizontalScrollController = ScrollController();

  @override
  void dispose() {
    horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const invoices = [
      ['INV001', 'Paid', 'Credit Card', r'$250.00'],
      ['INV002', 'Pending', 'PayPal', r'$150.00'],
      ['INV003', 'Unpaid', 'Bank Transfer', r'$350.00'],
      ['INV004', 'Paid', 'Credit Card', r'$450.00'],
      ['INV005', 'Paid', 'PayPal', r'$550.00'],
      ['INV006', 'Pending', 'Bank Transfer', r'$200.00'],
      ['INV007', 'Unpaid', 'Credit Card', r'$300.00'],
    ];
    final headings = ['CATEGORY', 'ASSIGNED', 'ACTIVITY', 'AVAILABLE'];
    return ShadTable(
      horizontalScrollController: horizontalScrollController,
      columnCount: invoices[0].length,
      rowCount: invoices.length,
      header: (context, column) {
        final isLast = column == headings.length - 1;
        return ShadTableCell.header(
          padding: EdgeInsets.zero,
          alignment: isLast ? Alignment.centerRight : null,
          child: ShadButton.link(
            padding: EdgeInsets.zero,
            child: Text(headings[column]),
          ),
        );
      },
      rowSpanExtent: (row) {
        // return null;

        return FixedSpanExtent(40);
      },
      columnSpanExtent: (index) {
        return switch (index) {
          0 => FractionalSpanExtent(3 / 8),
          _ => MaxSpanExtent(
            FractionalSpanExtent(5 / 24),
            FixedSpanExtent(110),
          ),
        };
      },
      builder: (context, index) {
        final invoice = invoices[index.row];
        return ShadTableCell(
          alignment:
              index.column == invoice.length - 1
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
          padding: EdgeInsets.zero,
          child: ShadButton.link(
            padding: EdgeInsets.zero,
            child: Text(invoice[index.column]),
          ),
        );
      },
      footer: (context, column) {
        if (column == 0) {
          return const ShadTableCell.footer(
            child: Text('Total', style: TextStyle(fontWeight: FontWeight.w500)),
          );
        }
        if (column == 3) {
          return const ShadTableCell.footer(
            alignment: Alignment.centerRight,
            child: Text(r'$2500.00'),
          );
        }
        return const ShadTableCell(child: SizedBox());
      },
    );
  }
}

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TableExample();
  }
}

class ReportLocation extends Location {
  @override
  LocationBuilder? get builder => (_) => Center(child: Text(path));

  @override
  String get path => 'report/';
}

class AccountLocation extends Location {
  @override
  LocationBuilder? get builder => (_) => Center(child: Text(path));

  @override
  String get path => 'account/';
}

class HomeLocation extends StatefulLocation {
  @override
  StatefulLocationBuilder get childBuilder => (context, shell) {
    return HomePage(shell: shell);
  };

  @override
  List<Location> get children => [
    ReportLocation(),
    BudgetLocation(),
    AccountLocation(),
  ];

  @override
  String get path => '/';
}

class HomePage extends StatefulWidget {
  const HomePage({required this.shell, super.key});
  final DuckShell shell;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final $expanded = ValueNotifier(true);

  @override
  void dispose() {
    $expanded.dispose();
    super.dispose();
  }

  void onAccountPressed() => widget.shell.switchChild(2);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: $expanded,
          builder: (context, expanded, child) {
            return SizedBox(
              width: expanded ? 250 : 60,
              child: Stack(
                children: [
                  CustomScrollView(
                    scrollBehavior: ShadScrollBehavior(),
                    slivers: [
                      SliverList.list(
                        children: [
                          SettingsMenuCard(),
                          ReportsMenuCard(
                            onPressed: () => widget.shell.switchChild(0),
                          ),
                          BudgetMenuCard(
                            onPressed: () => widget.shell.switchChild(1),
                          ),
                          BudgetAccountMenuCard(
                            onPressed: () => widget.shell.switchChild(2),
                          ),
                        ],
                      ),
                      SliverLayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.crossAxisExtent < 80) {
                            return SliverToBoxAdapter();
                          }
                          return SliverList.builder(
                            itemCount: 70,
                            itemBuilder: (context, index) {
                              return BudgetAccountMenuItem(
                                i: index,
                                onAccountPressed: onAccountPressed,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Align(
                    alignment:
                        expanded
                            ? AlignmentDirectional.bottomEnd
                            : AlignmentDirectional.bottomCenter,
                    child: ShadIconButton.secondary(
                      onPressed: () => $expanded.value = !$expanded.value,
                      icon: Icon(
                        expanded
                            ? LucideIcons.arrowLeftToLine
                            : LucideIcons.arrowRightToLine,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        FundwiseDivider(),
        Expanded(child: widget.shell),
      ],
    );
  }
}

class BudgetAccountMenuItem extends StatelessWidget {
  const BudgetAccountMenuItem({
    required this.onAccountPressed,
    required this.i,
    super.key,
  });

  final int i;
  final void Function() onAccountPressed;

  @override
  Widget build(BuildContext context) {
    return ShadButton.ghost(
      mainAxisAlignment: MainAxisAlignment.start,
      onPressed: onAccountPressed,
      leading: Icon(LucideIcons.piggyBank),
      child: Text('Account #$i'),
    );
  }
}

class BudgetMenuCard extends StatelessWidget {
  const BudgetMenuCard({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MenuCardBuilder(
      onPressed: onPressed,
      icon: LucideIcons.walletCards,
      label: 'Budget',
    );
  }
}

class MenuCardBuilder extends StatelessWidget {
  const MenuCardBuilder({
    required this.icon,
    required this.onPressed,
    required this.label,
    super.key,
  });

  final void Function() onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        if (contraints.maxWidth < 80) {
          return ShadIconButton.outline(onPressed: onPressed, icon: Icon(icon));
        }
        return ShadButton.outline(
          mainAxisAlignment: MainAxisAlignment.start,
          onPressed: onPressed,
          leading: Icon(icon),
          child: Text(label),
        );
      },
    );
  }
}

class BudgetAccountMenuCard extends StatelessWidget {
  const BudgetAccountMenuCard({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MenuCardBuilder(
      icon: LucideIcons.landmark,
      onPressed: onPressed,
      label: 'Accounts',
    );
  }
}

class ReportsMenuCard extends StatelessWidget {
  const ReportsMenuCard({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MenuCardBuilder(
      onPressed: onPressed,
      icon: LucideIcons.chartArea,
      label: 'Reports',
    );
  }
}

class SettingsMenuCard extends StatelessWidget {
  const SettingsMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return LayoutBuilder(
      builder: (context, contraints) {
        final shadAvatar = ShadAvatar(
          'https://app.requestly.io/delay/2000'
          '/avatars.githubusercontent.com/u/124599?v=4',
        );
        if (contraints.maxWidth < 80) {
          return ShadIconButton.raw(
            icon: shadAvatar,
            variant: ShadButtonVariant.outline,
            padding: EdgeInsets.all(4),
          );
        }
        return ShadButton.raw(
          variant: ShadButtonVariant.outline,
          height: 64,
          mainAxisAlignment: MainAxisAlignment.start,
          leading: shadAvatar,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'my budget',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.large,
              ),
              Text(
                'user@fundwise.dev',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.muted,
              ),
            ],
          ),
        );
      },
    );
  }
}
