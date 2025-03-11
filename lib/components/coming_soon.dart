import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({required this.child, required this.feature, super.key});
  final String feature;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShadTooltip(
      builder: (context) {
        final textTheme = ShadTheme.of(context).textTheme;
        return RichText(
          text: TextSpan(
            children: [
              TextSpan(text: feature, style: textTheme.p.copyWith(fontWeight: FontWeight.bold)),
              TextSpan(text: ' is coming soon!', style: textTheme.p),
            ],
          ),
        );
      },
      reverseDuration: Durations.short2,
      child: child,
    );
  }
}
