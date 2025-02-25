import 'package:flutter/material.dart';
import 'package:fundwise/components/menu_card_builder.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AccountsMenuCard extends StatelessWidget {
  const AccountsMenuCard({required this.onPressed, super.key});

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
