import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/components/menu_card_builder.dart';
import 'package:fundwise/root/router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BudgetMenuCard extends ConsumerWidget {
  const BudgetMenuCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuCardBuilder(
      onPressed: () => context.navigateTo(const BudgetShellRoute()),
      icon: LucideIcons.walletCards,
      label: 'Budget',
    );
  }
}
