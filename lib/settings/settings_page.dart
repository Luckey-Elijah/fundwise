import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/services/theme.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(themeControllerProvider.notifier);
    final state = ref.watch(themeControllerProvider);

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final mode in ThemeMode.values)
            ShadButton.raw(
              onPressed: () => controller.useMode(mode),
              variant:
                  mode == state.mode
                      ? ShadButtonVariant.primary
                      : ShadButtonVariant.secondary,
              leading: Icon(switch (mode) {
                ThemeMode.system => LucideIcons.sunMoon,
                ThemeMode.light => LucideIcons.sun,
                ThemeMode.dark => LucideIcons.moon,
              }),
              child: Text(mode.name),
            ),
        ],
      ),
    );
  }
}
