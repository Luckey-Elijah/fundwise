import 'package:app/theme_extension/decoration.dart';
import 'package:app/theme_extension/margin.dart';
import 'package:flutter/material.dart';

export 'package:app/theme_extension/decoration.dart';
export 'package:app/theme_extension/margin.dart';

ThemeData theme(ThemeData theme) {
  final br = BorderRadius.circular(4);

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
      DecorationTheme(
        primary: BoxDecoration(
          color: theme.colorScheme.tertiaryContainer,
          borderRadius: br,
        ),
        error: BoxDecoration(
          color: theme.colorScheme.errorContainer,
          borderRadius: br,
        ),
        borderRadius: br,
        mediumWidth: BoxConstraints.loose(const Size.fromWidth(300)),
      ),
    ],
  );
}
