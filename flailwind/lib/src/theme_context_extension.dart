import 'package:flailwind/src/text_style_with_context.dart';
import 'package:flutter/material.dart';

/// [Theme]-based extension methods for [BuildContext].
extension ThemeContextExtension on BuildContext {
  /// Returns the [ColorScheme] from the current [Theme].
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Returns the [ColorScheme.primaryContainer] from the current [Theme].
  Color get primaryContainer => colorScheme.primaryContainer;

  /// Returns the [ColorScheme.secondaryContainer] from the current [Theme].
  Color get secondaryContainer => colorScheme.secondaryContainer;

  /// Returns the [ColorScheme.errorContainer] from the current [Theme].
  Color get errorContainer => colorScheme.errorContainer;

  /// Returns the [ColorScheme.tertiaryContainer] from the current [Theme].
  Color get tertiaryContainer => colorScheme.tertiaryContainer;

  /// Returns the [ColorScheme.primary] from the current [Theme].
  Color get primary => colorScheme.primary;

  /// Returns the [ColorScheme.secondary] from the current [Theme].
  Color get secondary => colorScheme.secondary;

  /// Returns the [ColorScheme.error] from the current [Theme].
  Color get error => colorScheme.error;

  /// Returns the [ColorScheme.tertiary] from the current [Theme].
  Color get tertiary => colorScheme.tertiary;

  /// Returns the [ColorScheme.onPrimaryContainer] from the current [Theme].
  Color get onPrimaryContainer => colorScheme.onPrimaryContainer;

  /// Returns the [ColorScheme.onSecondaryContainer] from the current [Theme].
  Color get onSecondaryContainer => colorScheme.onSecondaryContainer;

  /// Returns the [ColorScheme.onTertiaryContainer] from the current [Theme].
  Color get onTertiaryContainer => colorScheme.onTertiaryContainer;

  /// Returns the [ColorScheme.onErrorContainer] from the current [Theme].
  Color get onErrorContainer => colorScheme.onErrorContainer;

  /// Returns the [TextTheme] from the current [Theme].
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns the [TextStyleWithContext] for [TextTheme.headlineLarge].
  TextStyleWithContext? get h1 => TextStyleWithContext(
        context: this,
        textStyle: textTheme.headlineLarge,
      );

  /// Returns the [TextStyleWithContext] for [TextTheme.headlineSmall].
  TextStyleWithContext? get h2 => TextStyleWithContext(
        context: this,
        textStyle: textTheme.headlineSmall,
      );

  /// Returns the [TextStyleWithContext] for [TextTheme.titleLarge].
  TextStyleWithContext? get h3 => TextStyleWithContext(
        context: this,
        textStyle: textTheme.titleLarge,
      );

  /// Returns the [TextStyleWithContext] for [TextTheme.bodyMedium].
  TextStyleWithContext? get p => TextStyleWithContext(
        context: this,
        textStyle: textTheme.bodyMedium,
      );

  /// Returns the [TextStyleWithContext] for [TextTheme.bodyMedium]
  /// with bold font weight.
  TextStyleWithContext? get em => p?.copyWith(fontWeight: FontWeight.bold);
}
