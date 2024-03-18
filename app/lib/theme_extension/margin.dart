import 'package:flutter/material.dart';
import 'package:theme_extensions_builder_annotation/theme_extensions_builder_annotation.dart';

part 'margin.g.theme.dart';

@themeExtensions
class MarginThemeExtension extends ThemeExtension<MarginThemeExtension>
    with _$ThemeExtensionMixin {
  const MarginThemeExtension({
    required this.small,
    required this.medium,
    required this.large,
  });

  final Size small;
  final Size medium;
  final Size large;
}

extension BuildSizedBox on Size {
  SizedBox get box => SizedBox.fromSize(size: this);
}
