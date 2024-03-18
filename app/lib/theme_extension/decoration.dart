import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'decoration.g.theme.dart';

@themeExtensions
class DecorationTheme extends ThemeExtension<DecorationTheme>
    with _$ThemeExtensionMixin {
  const DecorationTheme({
    required this.primary,
    required this.error,
    required this.mediumWidth,
    required this.borderRadius,
  });

  final BoxDecoration primary;
  final BoxDecoration error;
  final BoxConstraints mediumWidth;
  final BorderRadius borderRadius;
}
