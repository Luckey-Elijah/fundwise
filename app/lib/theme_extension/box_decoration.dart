import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'box_decoration.g.theme.dart';

@themeExtensions
class BoxDecorationThemeExtension
    extends ThemeExtension<BoxDecorationThemeExtension>
    with _$ThemeExtensionMixin {
  const BoxDecorationThemeExtension({required this.boxDecoration});

  final BoxDecoration boxDecoration;
}
