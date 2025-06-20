import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MenuCardBuilder extends StatelessWidget {
  const MenuCardBuilder({
    required this.icon,
    required this.onPressed,
    required this.label,
    this.selected = false,
    super.key,
  });

  final void Function()? onPressed;
  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 80) {
          return ShadIconButton.raw(
            onPressed: onPressed,
            variant: selected ? ShadButtonVariant.primary : ShadButtonVariant.ghost,
            enabled: enabled,
            icon: Icon(icon),
          );
        }
        return ShadButton.raw(
          variant: selected ? ShadButtonVariant.primary : ShadButtonVariant.ghost,
          enabled: enabled,
          mainAxisAlignment: MainAxisAlignment.start,
          onPressed: onPressed,
          leading: Icon(icon),
          child: Text(label),
        );
      },
    );
  }
}
