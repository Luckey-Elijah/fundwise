import 'package:app/theme_extension/box_decoration.dart';
import 'package:app/theme_extension/margin.dart';
import 'package:flutter/material.dart';

export 'package:app/theme_extension/box_decoration.dart';
export 'package:app/theme_extension/margin.dart';

ThemeData themeLight(ThemeData theme) {
  final scheme = theme.colorScheme;

  return theme.copyWith(
    appBarTheme: const AppBarTheme(
      toolbarHeight: kToolbarHeight,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
      ),
    ),
    extensions: [
      const MarginThemeExtension(
        small: Size.square(4),
        medium: Size.square(8),
        large: Size.square(16),
      ),
      BoxDecorationThemeExtension(
        boxDecoration: BoxDecoration(
          color: scheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ],
  );
}

ThemeData themeDark(ThemeData theme) {
  final scheme = theme.colorScheme;

  return theme.copyWith(
    appBarTheme: const AppBarTheme(
      toolbarHeight: kToolbarHeight,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
      ),
    ),
    extensions: [
      const MarginThemeExtension(
        small: Size.square(4),
        medium: Size.square(8),
        large: Size.square(16),
      ),
      BoxDecorationThemeExtension(
        boxDecoration: BoxDecoration(
          color: scheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ],
  );
}
