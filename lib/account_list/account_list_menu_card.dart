import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:fundwise/components/menu_card_builder.dart';
import 'package:fundwise/root/router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AccountListMenuCard extends StatelessWidget {
  const AccountListMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuCardBuilder(
      icon: LucideIcons.landmark,
      onPressed: () => context.navigateTo(const AccountListRoute()),
      label: 'Accounts',
    );
  }
}
