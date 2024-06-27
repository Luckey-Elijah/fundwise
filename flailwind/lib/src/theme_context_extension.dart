// ignore_for_file: public_member_api_docs

import 'package:flailwind/src/text_style_with_context.dart';
import 'package:flutter/material.dart';

extension ThemeContextExtension on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  Color get primaryContainer => colorScheme.primaryContainer;
  Color get secondaryContainer => colorScheme.secondaryContainer;
  Color get errorContainer => colorScheme.errorContainer;
  Color get tertiaryContainer => colorScheme.tertiaryContainer;

  Color get primary => colorScheme.primary;
  Color get secondary => colorScheme.secondary;
  Color get error => colorScheme.error;
  Color get tertiary => colorScheme.tertiary;

  Color get onPrimaryContainer => colorScheme.onPrimaryContainer;
  Color get onSecondaryContainer => colorScheme.onSecondaryContainer;
  Color get onTertiaryContainer => colorScheme.onTertiaryContainer;
  Color get onErrorContainer => colorScheme.onErrorContainer;

  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyleWithContext? get h1 => TextStyleWithContext(
        context: this,
        textStyle: textTheme.headlineLarge,
      );
  TextStyleWithContext? get h2 => TextStyleWithContext(
        context: this,
        textStyle: textTheme.headlineSmall,
      );

  TextStyleWithContext? get h3 => TextStyleWithContext(
        context: this,
        textStyle: textTheme.titleLarge,
      );

  TextStyleWithContext? get p => TextStyleWithContext(
        context: this,
        textStyle: textTheme.bodyMedium,
      );

  TextStyleWithContext? get em => p?.copyWith(fontWeight: FontWeight.bold);
}
