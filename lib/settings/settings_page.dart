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
    return const Column(children: [SettingsMenubar()]);
  }
}

class SettingsMenubar extends ConsumerWidget {
  const SettingsMenubar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.only(top: 4),
      child: ShadMenubar(
        items: [
          ShadMenubarItem(items: [ThemeModeContextMenuPicker()], child: Text('View')),
          ShadMenubarItem(items: [LogoutContextMenuButton()], child: Text('Account')),
        ],
      ),
    );
  }
}

class LogoutContextMenuButton extends ConsumerWidget {
  const LogoutContextMenuButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clear = ref.read(pocketbaseProvider).authStore.clear;
    return ShadContextMenuItem(
      trailing: const Icon(LucideIcons.logOut),
      onPressed: clear,
      child: const Text('Logout'),
    );
  }
}

class ThemeModeContextMenuPicker extends ConsumerWidget {
  const ThemeModeContextMenuPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeControllerProvider.select((i) => i.mode));

    return ShadContextMenuItem(
      items: [
        for (final themeMode in ThemeMode.values)
          ShadContextMenuItem(
            leading: Icon(themeMode.icon),
            trailing: themeMode == mode ? const Icon(LucideIcons.check) : null,
            child: Text(themeMode.label),
            onPressed: () => ref.read(themeControllerProvider.notifier).useMode(themeMode),
          ),
      ],
      trailing: const Icon(LucideIcons.chevronRight),
      child: const Text('Theme Mode'),
    );
  }
}
