import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/components/material.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:fundwise/theme/theme_controller.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: const [LogoutButton(), ThemePicker()]);
  }
}

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShadButton(
      child: Text('Logout'),
      onPressed: () {
        ref.read(pocketbaseProvider).authStore.clear();
      },
    );
  }
}

class ThemePicker extends ConsumerStatefulWidget {
  const ThemePicker({super.key});

  @override
  ConsumerState<ThemePicker> createState() => _ThemePickerState();
}

class _ThemePickerState extends ConsumerState<ThemePicker> {
  @override
  Widget build(BuildContext context) {
    final initialValue = ref.watch(themeControllerProvider.select((i) => i.mode));
    final iconColor = ShadTheme.of(context).colorScheme.foreground;
    return ShadSelect<ThemeMode>(
      initialValue: initialValue,
      onChanged: (value) {
        if (value != null) ref.read(themeControllerProvider.notifier).useMode(value);
      },
      options: [
        ShadOption<ThemeMode>(
          value: ThemeMode.system,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Text('Auto'), Spacer(), Icon(LucideIcons.sunMoon, color: iconColor)],
          ),
        ),
        ShadOption<ThemeMode>(
          value: ThemeMode.light,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Light'),
              Spacer(),
              Icon(LucideIcons.sun, color: ShadTheme.of(context).colorScheme.foreground),
            ],
          ),
        ),
        ShadOption<ThemeMode>(
          value: ThemeMode.dark,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Dark'),
              Spacer(),
              Icon(LucideIcons.moon, color: ShadTheme.of(context).colorScheme.foreground),
            ],
          ),
        ),
      ],
      selectedOptionBuilder: (context, mode) {
        return Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(switch (mode) {
              ThemeMode.system => LucideIcons.sunMoon,
              ThemeMode.light => LucideIcons.sun,
              ThemeMode.dark => LucideIcons.moon,
            }, color: ShadTheme.of(context).colorScheme.foreground),
            Text(switch (mode) {
              ThemeMode.system => 'Auto',
              ThemeMode.light => 'Light',
              ThemeMode.dark => 'Dark',
            }),
          ],
        );
      },
    );
  }
}
