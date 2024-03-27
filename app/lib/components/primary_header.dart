import 'package:app/theme_extension/theme.dart';
import 'package:flutter/material.dart';

class PrimaryHeader extends StatelessWidget {
  const PrimaryHeader({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(
        Size.fromHeight(
          AppBarTheme.of(context).toolbarHeight ?? kToolbarHeight + 12,
        ),
      ),
      child: DecoratedBox(
        decoration: context.decorationTheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: child,
        ),
      ),
    );
  }
}
