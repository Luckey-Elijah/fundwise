import 'package:app/components/menu_card_builder.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
