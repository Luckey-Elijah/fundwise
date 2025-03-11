import 'package:flutter/material.dart' show IconData, ThemeMode;
import 'package:shadcn_ui/shadcn_ui.dart' show LucideIcons;

export 'package:flutter/material.dart' show Durations, ThemeMode;

extension ThemeModeX on ThemeMode {
  IconData get icon => switch (this) {
    ThemeMode.system => LucideIcons.sunMoon,
    ThemeMode.light => LucideIcons.sun,
    ThemeMode.dark => LucideIcons.moon,
  };

  String get label => switch (this) {
    ThemeMode.system => 'Auto',
    ThemeMode.light => 'Light',
    ThemeMode.dark => 'Dark',
  };
}
