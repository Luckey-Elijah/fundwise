import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AccountMenuItem extends StatelessWidget {
  const AccountMenuItem({
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
