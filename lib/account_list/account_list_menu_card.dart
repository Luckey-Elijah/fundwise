import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/components/menu_card_builder.dart';
import 'package:fundwise/root/router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AccountListMenuCard extends ConsumerWidget {
  const AccountListMenuCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuCardBuilder(
      icon: LucideIcons.landmark,
      onPressed: () {
        ref.read(routerProvider).navigate(AccountListRoute());
      },
      label: 'Accounts',
    );
  }
}
