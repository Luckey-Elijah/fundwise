// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class TextStyleWithContext extends TextStyle {
  TextStyleWithContext({
    required this.context,
    required TextStyle? textStyle,
    super.inherit,
    super.package,
  }) : super(
          color: textStyle?.color,
          backgroundColor: textStyle?.backgroundColor,
          fontSize: textStyle?.fontSize,
          fontWeight: textStyle?.fontWeight,
          fontStyle: textStyle?.fontStyle,
          letterSpacing: textStyle?.letterSpacing,
          wordSpacing: textStyle?.wordSpacing,
          textBaseline: textStyle?.textBaseline,
          height: textStyle?.height,
          leadingDistribution: textStyle?.leadingDistribution,
          locale: textStyle?.locale,
          foreground: textStyle?.foreground,
          background: textStyle?.background,
          shadows: textStyle?.shadows,
          overflow: textStyle?.overflow,
          fontFeatures: textStyle?.fontFeatures,
          fontVariations: textStyle?.fontVariations,
          decoration: textStyle?.decoration,
          decorationColor: textStyle?.decorationColor,
          decorationStyle: textStyle?.decorationStyle,
          decorationThickness: textStyle?.decorationThickness,
          debugLabel: textStyle?.debugLabel,
          fontFamily: textStyle?.fontFamily,
          fontFamilyFallback: textStyle?.fontFamilyFallback,
        );

  final BuildContext context;

  @override
  TextStyleWithContext copyWith({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    List<FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    TextOverflow? overflow,
  }) {
    return TextStyleWithContext(
      context: context,
      textStyle: TextStyle(
        inherit: inherit ?? this.inherit,
        color: color ?? this.color,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        fontSize: fontSize ?? this.fontSize,
        fontWeight: fontWeight ?? this.fontWeight,
        fontStyle: fontStyle ?? this.fontStyle,
        letterSpacing: letterSpacing ?? this.letterSpacing,
        wordSpacing: wordSpacing ?? this.wordSpacing,
        textBaseline: textBaseline ?? this.textBaseline,
        height: height ?? this.height,
        leadingDistribution: leadingDistribution ?? this.leadingDistribution,
        locale: locale ?? this.locale,
        foreground: foreground ?? this.foreground,
        background: background ?? this.background,
        shadows: shadows ?? this.shadows,
        fontFeatures: fontFeatures ?? this.fontFeatures,
        fontVariations: fontVariations ?? this.fontVariations,
        decoration: decoration ?? this.decoration,
        decorationColor: decorationColor ?? this.decorationColor,
        decorationStyle: decorationStyle ?? this.decorationStyle,
        decorationThickness: decorationThickness ?? this.decorationThickness,
        debugLabel: debugLabel ?? this.debugLabel,
        fontFamily: fontFamily ?? this.fontFamily,
        fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
        overflow: overflow ?? this.overflow,
        package: fontFamily =
            package == null ? fontFamily : 'packages/$package/$fontFamily',
      ),
    );
  }
}
