import 'package:flailwind/src/theme_context_extension.dart';
import 'package:flutter/material.dart';

/// @template text_style_with_context
/// A [TextStyle] that has a [BuildContext] as a property to be used in
/// composing styles.
/// @endtemplate
class TextStyleWithContext extends TextStyle {
  /// @macro text_style_with_context
  TextStyleWithContext({
    required BuildContext context,
    required TextStyle? textStyle,
    super.inherit,
    super.package,
  })  : _context = context,
        super(
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

  final BuildContext _context;

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
      context: _context,
      inherit: inherit ?? this.inherit,
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

/// Extension methods for [TextStyleWithContext].
extension TextStyleHelper on TextStyleWithContext? {
  /// Returns a new [TextStyleWithContext]
  /// with the font weight set to [FontWeight.w300].
  TextStyleWithContext? get thin => this?.copyWith(fontWeight: FontWeight.w300);

  /// Returns a new [TextStyleWithContext]
  /// with the font weight set to [FontWeight.bold].
  TextStyleWithContext? get bold => this?.copyWith(fontWeight: FontWeight.bold);

  /// Returns a new [TextStyleWithContext]
  /// with the font style set to [FontStyle.italic].
  TextStyleWithContext? get italic =>
      this?.copyWith(fontStyle: FontStyle.italic);

  /// Returns a new [TextStyleWithContext]
  /// with the font style set to [FontStyle.normal].
  TextStyleWithContext? get normal =>
      this?.copyWith(fontStyle: FontStyle.normal);

  /// Returns a new [TextStyleWithContext] with the letter spacing set to `-4`.
  TextStyleWithContext? get extraTight => this?.copyWith(letterSpacing: -4);

  /// Returns a new [TextStyleWithContext] with the letter spacing set to `-2`.
  TextStyleWithContext? get tight => this?.copyWith(letterSpacing: -2);

  /// Returns a new [TextStyleWithContext] with the letter spacing set to `4`.
  TextStyleWithContext? get wide => this?.copyWith(letterSpacing: 4);

  /// Returns a new [TextStyleWithContext] with the letter spacing set to `8`.
  TextStyleWithContext? get extraWide => this?.copyWith(letterSpacing: 8);

  /// Returns a new [TextStyleWithContext] with the color set to [color].
  TextStyleWithContext? color(Color color) => this?.copyWith(color: color);

  /// Returns a new [TextStyleWithContext]
  /// with the color set to [ColorScheme.primary].
  TextStyleWithContext? get primary => this?.copyWith(
        color: this?._context.primary,
        decorationColor: this?._context.primary,
      );

  /// Returns a new [TextStyleWithContext]
  /// with the color set to [ColorScheme.secondary].
  TextStyleWithContext? get secondary => this?.copyWith(
        color: this?._context.secondary,
        decorationColor: this?._context.secondary,
      );

  /// Returns a new [TextStyleWithContext]
  /// with the color set to [ColorScheme.error].
  TextStyleWithContext? get error => this?.copyWith(
        color: this?._context.error,
        decorationColor: this?._context.error,
      );

  /// Returns a new [TextStyleWithContext]
  /// with the color set to [ColorScheme.tertiary].
  TextStyleWithContext? get tertiary => this?.copyWith(
        color: this?._context.tertiary,
        decorationColor: this?._context.tertiary,
      );

  /// Returns a new [TextStyleWithContext]
  /// with the color set to [ColorScheme.onPrimary].
  TextStyleWithContext? get onPrimary =>
      this?.copyWith(color: this?._context.onPrimaryContainer);

  /// Returns a new [TextStyleWithContext]
  /// with the color set to [ColorScheme.onSecondary].
  TextStyleWithContext? get onSecondary =>
      this?.copyWith(color: this?._context.onSecondaryContainer);

  /// Returns a new [TextStyleWithContext]
  /// with the color set to [ColorScheme.onError].
  TextStyleWithContext? get onError =>
      this?.copyWith(color: this?._context.onErrorContainer);

  /// Returns a new [TextStyleWithContext]
  /// with the color set to [ColorScheme.onTertiary].
  TextStyleWithContext? get onTertiary =>
      this?.copyWith(color: this?._context.onTertiaryContainer);

  /// Returns a new [TextStyleWithContext]
  /// with the background color set to [color].
  TextStyleWithContext? bg(Color color) =>
      this?.copyWith(backgroundColor: color);

  /// Returns a new [TextStyleWithContext]
  /// with the background color set to [ColorScheme.primaryContainer].
  TextStyleWithContext? get bgPrimary =>
      this?.copyWith(backgroundColor: this?._context.primaryContainer);

  /// Returns a new [TextStyleWithContext]
  /// with the background color set to [ColorScheme.secondaryContainer].
  TextStyleWithContext? get bgSecondary =>
      this?.copyWith(backgroundColor: this?._context.secondaryContainer);

  /// Returns a new [TextStyleWithContext]
  /// with the background color set to [ColorScheme.errorContainer].
  TextStyleWithContext? get bgError =>
      this?.copyWith(backgroundColor: this?._context.errorContainer);

  /// Returns a new [TextStyleWithContext]
  /// with the background color set to [ColorScheme.tertiaryContainer].
  TextStyleWithContext? get bgTertiary =>
      this?.copyWith(backgroundColor: this?._context.tertiaryContainer);

  /// Returns a new [TextStyleWithContext]
  /// with the decoration color set to [decorationColor].
  TextStyleWithContext? decorationColor(Color decorationColor) =>
      this?.copyWith(decorationColor: decorationColor);

  /// Returns a new [TextStyleWithContext]
  /// with the decoration style set to [TextDecorationStyle.solid].
  TextStyleWithContext? get decorationSolid =>
      this?.copyWith(decorationStyle: TextDecorationStyle.solid);

  /// Returns a new [TextStyleWithContext]
  /// with the decoration style set to [TextDecorationStyle.double].
  TextStyleWithContext? get decorationDouble =>
      this?.copyWith(decorationStyle: TextDecorationStyle.double);

  /// Returns a new [TextStyleWithContext]
  /// with the decoration style set to [TextDecorationStyle.dotted].
  TextStyleWithContext? get decorationDotted =>
      this?.copyWith(decorationStyle: TextDecorationStyle.dotted);

  /// Returns a new [TextStyleWithContext]
  /// with the decoration style set to [TextDecorationStyle.dashed].
  TextStyleWithContext? get decorationDashed =>
      this?.copyWith(decorationStyle: TextDecorationStyle.dashed);

  /// Returns a new [TextStyleWithContext]
  /// with the decoration style set to [TextDecorationStyle.wavy].
  TextStyleWithContext? get decorationWavy =>
      this?.copyWith(decorationStyle: TextDecorationStyle.wavy);

  /// Returns a new [TextStyleWithContext]
  /// with the decoration thickness set to [decorationThickness].
  TextStyleWithContext? decorationThickness(double decorationThickness) =>
      this?.copyWith(decorationThickness: decorationThickness);

  /// Returns a new [TextStyleWithContext]
  /// with the foreground paint set to [paint].
  TextStyleWithContext? paint(Paint paint) => this?.copyWith(foreground: paint);

  /// Returns a new [TextStyleWithContext]
  /// with the background paint set to [paint].
  TextStyleWithContext? background(Paint paint) =>
      this?.copyWith(background: paint);

  /// Returns a new [TextStyleWithContext]
  /// with the decoration set to [TextDecoration.underline].
  TextStyleWithContext? get underline =>
      this?.copyWith(decoration: TextDecoration.underline);

  /// Returns a new [TextStyleWithContext]
  /// with the decoration set to [TextDecoration.lineThrough].
  TextStyleWithContext? get lineThrough =>
      this?.copyWith(decoration: TextDecoration.lineThrough);

  /// Returns a new [TextStyleWithContext]
  /// with the decoration set to [TextDecoration.overline].
  TextStyleWithContext? get overline =>
      this?.copyWith(decoration: TextDecoration.overline);

  /// Returns a new [TextStyleWithContext]
  /// with the overflow set to [TextOverflow.clip].
  TextStyleWithContext? get clip => this?.copyWith(overflow: TextOverflow.clip);

  /// Returns a new [TextStyleWithContext]
  /// with the overflow set to [TextOverflow.ellipsis].
  TextStyleWithContext? get ellipsis =>
      this?.copyWith(overflow: TextOverflow.ellipsis);

  /// Returns a new [TextStyleWithContext]
  /// with the overflow set to [TextOverflow.fade].
  TextStyleWithContext? get fade => this?.copyWith(overflow: TextOverflow.fade);

  /// Returns a new [TextStyleWithContext]
  /// with the overflow set to [TextOverflow.visible].
  TextStyleWithContext? get visible =>
      this?.copyWith(overflow: TextOverflow.visible);

  /// Returns a new [TextStyleWithContext]
  /// with the font size set to the current text theme's small body font size.
  TextStyleWithContext? get sm => this?.copyWith(
        fontSize: this?._context.textTheme.bodySmall?.fontSize,
      );

  /// Returns a new [TextStyleWithContext]
  /// with the font size set to the current text theme's medium body font size.
  TextStyleWithContext? get md => this?.copyWith(
        fontSize: this?._context.textTheme.bodyMedium?.fontSize,
      );

  /// Returns a new [TextStyleWithContext]
  /// with the font size set to the current text theme's large body font size.
  TextStyleWithContext? get lg => this?.copyWith(
        fontSize: this?._context.textTheme.bodyLarge?.fontSize,
      );

  /// Returns a new [TextStyleWithContext]
  /// with the font size set to the current text theme's large title font size.
  TextStyleWithContext? get xl => this?.copyWith(
        fontSize: this?._context.textTheme.titleLarge?.fontSize,
      );

  /// Returns a new [TextStyleWithContext]
  /// with the font size set to the current
  /// text theme's small headline font size.
  TextStyleWithContext? get xxl => this?.copyWith(
        fontSize: this?._context.textTheme.headlineSmall?.fontSize,
      );

  /// Returns a new [TextStyleWithContext]
  /// with the font size set to the current
  /// text theme's large headline font size.
  TextStyleWithContext? get xxxl => this?.copyWith(
        fontSize: this?._context.textTheme.headlineLarge?.fontSize,
      );

  /// Returns the current [TextStyle], [textStyle], or a default [TextStyle].
  TextStyle orDefault([TextStyle? textStyle]) =>
      this ?? textStyle ?? const TextStyle();
}
