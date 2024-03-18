// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'box_decoration.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$ThemeExtensionMixin on ThemeExtension<BoxDecorationThemeExtension> {
  @override
  ThemeExtension<BoxDecorationThemeExtension> copyWith({
    BoxDecoration? boxDecoration,
  }) {
    final object = this as BoxDecorationThemeExtension;

    return BoxDecorationThemeExtension(
      boxDecoration: boxDecoration ?? object.boxDecoration,
    );
  }

  @override
  ThemeExtension<BoxDecorationThemeExtension> lerp(
    ThemeExtension<BoxDecorationThemeExtension>? other,
    double t,
  ) {
    final otherValue = other;

    if (otherValue is! BoxDecorationThemeExtension) {
      return this;
    }

    final value = this as BoxDecorationThemeExtension;

    return BoxDecorationThemeExtension(
      boxDecoration: BoxDecoration.lerp(
        value.boxDecoration,
        otherValue.boxDecoration,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    final value = this as BoxDecorationThemeExtension;

    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BoxDecorationThemeExtension &&
            identical(value.boxDecoration, other.boxDecoration));
  }

  @override
  int get hashCode {
    final value = this as BoxDecorationThemeExtension;

    return Object.hash(
      runtimeType,
      value.boxDecoration,
    );
  }
}

extension BoxDecorationThemeExtensionBuildContext on BuildContext {
  BoxDecorationThemeExtension get boxDecorationTheme =>
      Theme.of(this).extension<BoxDecorationThemeExtension>()!;
}
