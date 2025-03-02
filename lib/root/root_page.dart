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
                    scrollBehavior: ShadScrollBehavior(),
                    slivers: [
                      SliverList.list(
                        children: const [
                          SettingsMenuCard(),
                          BudgetMenuCard(),
                          ReportsMenuCard(),
                          AccountListMenuCard(),
                        ],
                      ),
                      SliverLayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.crossAxisExtent < 80) {
                            return SliverToBoxAdapter();
                          }

                          return SliverList.builder(
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return ShadButton.ghost(
                                mainAxisAlignment: MainAxisAlignment.start,
                                onPressed: () {
                                  ref.read(routerProvider).navigate(AccountDetailRoute(id: index));
                                },
                                leading: Icon(LucideIcons.piggyBank),
                                child: Text('Account #$index'),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  if (wideEnough)
                    _CollapseButton(onPressed: onCollapseButtonPressed, expanded: expanded),
                ],
              ),
            ),
            ShadDivider.vertical(),
            Expanded(child: AutoRouter()),
          ],
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
