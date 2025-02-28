import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class BuilderBackground extends StatelessWidget {
  const BuilderBackground({required this.child, super.key});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final color = ShadTheme.of(context).colorScheme.background;
    return ColoredBox(color: color, child: SizedBox.expand(child: child));
  }
}
