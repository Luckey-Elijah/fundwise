// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'decoration.dart';

// **************************************************************************
// ThemeExtensionsGenerator
// **************************************************************************

mixin _$ThemeExtensionMixin on ThemeExtension<DecorationTheme> {
  @override
  ThemeExtension<DecorationTheme> copyWith({
    BoxDecoration? primary,
    BoxDecoration? error,
    BoxConstraints? smallWidth,
    BoxConstraints? mediumWidth,
    BoxConstraints? largeWidth,
    BorderRadius? borderRadius,
  }) {
    final object = this as DecorationTheme;

    return DecorationTheme(
      primary: primary ?? object.primary,
      error: error ?? object.error,
      smallWidth: smallWidth ?? object.smallWidth,
      mediumWidth: mediumWidth ?? object.mediumWidth,
      largeWidth: largeWidth ?? object.largeWidth,
      borderRadius: borderRadius ?? object.borderRadius,
    );
  }

  @override
  ThemeExtension<DecorationTheme> lerp(
    ThemeExtension<DecorationTheme>? other,
    double t,
  ) {
    final otherValue = other;

    if (otherValue is! DecorationTheme) {
      return this;
    }

    final value = this as DecorationTheme;

    return DecorationTheme(
      primary: BoxDecoration.lerp(
        value.primary,
        otherValue.primary,
        t,
      )!,
      error: BoxDecoration.lerp(
        value.error,
        otherValue.error,
        t,
      )!,
      smallWidth: BoxConstraints.lerp(
        value.smallWidth,
        otherValue.smallWidth,
        t,
      )!,
      mediumWidth: BoxConstraints.lerp(
        value.mediumWidth,
        otherValue.mediumWidth,
        t,
      )!,
      largeWidth: BoxConstraints.lerp(
        value.largeWidth,
        otherValue.largeWidth,
        t,
      )!,
      borderRadius: BorderRadius.lerp(
        value.borderRadius,
        otherValue.borderRadius,
        t,
      )!,
    );
  }

  @override
  bool operator ==(Object other) {
    final value = this as DecorationTheme;

    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DecorationTheme &&
            identical(value.primary, other.primary) &&
            identical(value.error, other.error) &&
            identical(value.smallWidth, other.smallWidth) &&
            identical(value.mediumWidth, other.mediumWidth) &&
            identical(value.largeWidth, other.largeWidth) &&
            identical(value.borderRadius, other.borderRadius));
  }

  @override
  int get hashCode {
    final value = this as DecorationTheme;

    return Object.hash(
      runtimeType,
      value.primary,
      value.error,
      value.smallWidth,
      value.mediumWidth,
      value.largeWidth,
      value.borderRadius,
    );
  }
}

extension DecorationThemeBuildContext on BuildContext {
  DecorationTheme get decorationTheme =>
      Theme.of(this).extension<DecorationTheme>()!;
}
