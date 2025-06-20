import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/account_list/account_list_menu_card.dart';
import 'package:fundwise/budget/budget_menu_card.dart';
import 'package:fundwise/reports/reports_menu_card.dart';
import 'package:fundwise/root/router.dart';
import 'package:fundwise/settings/settings_menu_card.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class RootPage extends ConsumerStatefulWidget {
  const RootPage({super.key});

  @override
  ConsumerState<RootPage> createState() => _RootPageState();
}

class _RootPageState extends ConsumerState<RootPage> {
  bool expanded = true;
  void onCollapseButtonPressed() => setState(() => expanded = !expanded);
  final routerKey = GlobalKey<AutoRouterState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wideEnough = constraints.maxWidth > 450;
        return Row(
          children: [
            SizedBox(
              width: (wideEnough && expanded) ? 250 : 60,
              child: Stack(
                children: [
                  CustomScrollView(
                    scrollBehavior: const ShadScrollBehavior(),
                    slivers: [
                      SliverList.list(
                        children: const [
                          SettingsMenuCard(),
                          ShadSeparator.horizontal(),
                          BudgetMenuCard(),
                          ShadSeparator.horizontal(),
                          ReportsMenuCard(),
                          ShadSeparator.horizontal(),
                          AccountListMenuCard(),
                        ],
                      ),
                      SliverLayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.crossAxisExtent < 80) {
                            return const SliverToBoxAdapter();
                          }

                          return const _AccountListNavigationItems();
                        },
                      ),
                    ],
                  ),
                  if (wideEnough)
                    _CollapseButton(
                      onPressed: onCollapseButtonPressed,
                      expanded: expanded,
                    ),
                ],
              ),
            ),
            const ShadSeparator.vertical(),
            Expanded(child: AutoRouter(key: routerKey)),
          ],
        );
      },
    );
  }
}

class _AccountListNavigationItems extends StatelessWidget {
  const _AccountListNavigationItems();

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 8 + 1,
      itemBuilder: (context, index) {
        if (index == 0) return const ShadSeparator.horizontal();

        final i = index - 1;
        return ShadButton.ghost(
          mainAxisAlignment: MainAxisAlignment.start,
          onPressed: () {
            context.navigateTo(AccountDetailRoute(id: i));
          },
          leading: const Icon(LucideIcons.piggyBank),
          child: Text('Account #$i'),
        );
      },
    );
  }
}

class _CollapseButton extends StatelessWidget {
  const _CollapseButton({required this.onPressed, required this.expanded});

  final void Function() onPressed;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: expanded ? AlignmentDirectional.bottomEnd : AlignmentDirectional.bottomCenter,
      child: ShadIconButton.secondary(
        onPressed: onPressed,
        icon: Icon(expanded ? LucideIcons.arrowLeftToLine : LucideIcons.arrowRightToLine),
      ),
    );
  }
}
