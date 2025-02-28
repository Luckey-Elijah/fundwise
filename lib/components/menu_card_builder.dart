import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MenuCardBuilder extends StatelessWidget {
  const MenuCardBuilder({
    required this.icon,
    required this.onPressed,
    required this.label,
    super.key,
  });

  final void Function() onPressed;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 80) {
          return ShadIconButton.outline(onPressed: onPressed, icon: Icon(icon));
        }
        return ShadButton.outline(
          mainAxisAlignment: MainAxisAlignment.start,
          onPressed: onPressed,
          leading: Icon(icon),
          child: Text(label),
        );
      },
    );
  }
}
