// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'margin.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$ThemeExtensionMixin on ThemeExtension<MarginThemeExtension> {
  @override
  ThemeExtension<MarginThemeExtension> copyWith({
    Size? small,
    Size? medium,
    Size? large,
  }) {
    final object = this as MarginThemeExtension;

    return MarginThemeExtension(
      small: small ?? object.small,
      medium: medium ?? object.medium,
      large: large ?? object.large,
    );
  }

  @override
  ThemeExtension<MarginThemeExtension> lerp(
    ThemeExtension<MarginThemeExtension>? other,
    double t,
  ) {
    final otherValue = other;

    if (otherValue is! MarginThemeExtension) {
      return this;
    }

    final value = this as MarginThemeExtension;

    return MarginThemeExtension(
      small: Size.lerp(
        value.small,
        otherValue.small,
        t,
      )!,
      medium: Size.lerp(
        value.medium,
        otherValue.medium,
        t,
      )!,
      large: Size.lerp(
        value.large,
        otherValue.large,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    final value = this as MarginThemeExtension;

    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MarginThemeExtension &&
            identical(value.small, other.small) &&
            identical(value.medium, other.medium) &&
            identical(value.large, other.large));
  }

  @override
  int get hashCode {
    final value = this as MarginThemeExtension;

    return Object.hash(
      runtimeType,
      value.small,
      value.medium,
      value.large,
    );
  }
}

extension MarginThemeExtensionBuildContext on BuildContext {
  MarginThemeExtension get marginTheme =>
      Theme.of(this).extension<MarginThemeExtension>()!;
}
