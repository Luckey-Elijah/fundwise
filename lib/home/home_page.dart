import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/account/account_location.dart';
import 'package:fundwise/account/account_menu_item.dart';
import 'package:fundwise/account/accounts_menu_card.dart';
import 'package:fundwise/budget/budget_menu_card.dart';
import 'package:fundwise/components/fundwise_divider.dart';
import 'package:fundwise/reports/reports_menu_card.dart';
import 'package:fundwise/settings/settings_menu_card.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({required this.shell, super.key});
  final DuckShell shell;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final $expanded = ValueNotifier(true);

  @override
  void dispose() {
    $expanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = DuckRouter.of(context);

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
                            onPressed: () {
                              widget.shell.switchChild(1);
                            },
                          ),
                          BudgetMenuCard(
                            onPressed: () => widget.shell.switchChild(0),
                          ),
                          AccountsMenuCard(
                            onPressed: () {
                              widget.shell.switchChild(2);
                              router.navigate(
                                to: AccountLocation(),
                                replace: true,
                              );
                            },
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
                              return AccountMenuItem(
                                i: index,
                                onAccountPressed: () {
                                  widget.shell.switchChild(2);
                                  router.navigate(
                                    replace: true,
                                    to: AccountLocation(id: index),
                                  );
                                },
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
