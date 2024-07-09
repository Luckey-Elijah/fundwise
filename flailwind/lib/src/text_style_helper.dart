// ignore_for_file: public_member_api_docs

import 'package:flailwind/src/text_style_with_context.dart';
import 'package:flailwind/src/theme_context_extension.dart';
import 'package:flutter/material.dart';

extension TextStyleHelper on TextStyleWithContext? {
  TextStyleWithContext? get thin => this?.copyWith(fontWeight: FontWeight.w300);
  TextStyleWithContext? get bold => this?.copyWith(fontWeight: FontWeight.bold);

  TextStyleWithContext? get italic =>
      this?.copyWith(fontStyle: FontStyle.italic);

  TextStyleWithContext? get normal =>
      this?.copyWith(fontStyle: FontStyle.normal);

  TextStyleWithContext? get extraTight => this?.copyWith(letterSpacing: -4);
  TextStyleWithContext? get tight => this?.copyWith(letterSpacing: -2);
  TextStyleWithContext? get wide => this?.copyWith(letterSpacing: 4);
  TextStyleWithContext? get extraWide => this?.copyWith(letterSpacing: 8);

  TextStyleWithContext? color(Color color) => this?.copyWith(color: color);

  TextStyleWithContext? get primary => this?.copyWith(
        color: this?.context.primary,
        decorationColor: this?.context.primary,
      );

  TextStyleWithContext? get secondary => this?.copyWith(
        color: this?.context.secondary,
        decorationColor: this?.context.secondary,
      );

  TextStyleWithContext? get error => this?.copyWith(
        color: this?.context.error,
        decorationColor: this?.context.error,
      );

  TextStyleWithContext? get tertiary => this?.copyWith(
        color: this?.context.tertiary,
        decorationColor: this?.context.tertiary,
      );

  TextStyleWithContext? get onPrimary =>
      this?.copyWith(color: this?.context.onPrimaryContainer);
  TextStyleWithContext? get onSecondary =>
      this?.copyWith(color: this?.context.onSecondaryContainer);
  TextStyleWithContext? get onError =>
      this?.copyWith(color: this?.context.onErrorContainer);
  TextStyleWithContext? get onTertiary =>
      this?.copyWith(color: this?.context.onTertiaryContainer);

  TextStyleWithContext? bg(Color color) =>
      this?.copyWith(backgroundColor: color);

  TextStyleWithContext? get bgPrimary =>
      this?.copyWith(backgroundColor: this?.context.primaryContainer);
  TextStyleWithContext? get bgSecondary =>
      this?.copyWith(backgroundColor: this?.context.secondaryContainer);
  TextStyleWithContext? get bgError =>
      this?.copyWith(backgroundColor: this?.context.errorContainer);
  TextStyleWithContext? get bgTertiary =>
      this?.copyWith(backgroundColor: this?.context.tertiaryContainer);

  TextStyleWithContext? decorationColor(Color decorationColor) =>
      this?.copyWith(decorationColor: decorationColor);

  TextStyleWithContext? get decorationSolid =>
      this?.copyWith(decorationStyle: TextDecorationStyle.solid);
  TextStyleWithContext? get decorationDouble =>
      this?.copyWith(decorationStyle: TextDecorationStyle.double);
  TextStyleWithContext? get decorationDotted =>
      this?.copyWith(decorationStyle: TextDecorationStyle.dotted);
  TextStyleWithContext? get decorationDashed =>
      this?.copyWith(decorationStyle: TextDecorationStyle.dashed);
  TextStyleWithContext? get decorationWavy =>
      this?.copyWith(decorationStyle: TextDecorationStyle.wavy);

  TextStyleWithContext? decThick(double decorationThickness) =>
      this?.copyWith(decorationThickness: decorationThickness);

  TextStyleWithContext? paint(Paint paint) => this?.copyWith(foreground: paint);
  TextStyleWithContext? paintBg(Paint paint) =>
      this?.copyWith(background: paint);

  TextStyleWithContext? get underline =>
      this?.copyWith(decoration: TextDecoration.underline);
  TextStyleWithContext? get lineThrough =>
      this?.copyWith(decoration: TextDecoration.lineThrough);
  TextStyleWithContext? get overline =>
      this?.copyWith(decoration: TextDecoration.overline);

  TextStyleWithContext? get clip => this?.copyWith(overflow: TextOverflow.clip);
  TextStyleWithContext? get ellipsis =>
      this?.copyWith(overflow: TextOverflow.ellipsis);
  TextStyleWithContext? get fade => this?.copyWith(overflow: TextOverflow.fade);
  TextStyleWithContext? get visible =>
      this?.copyWith(overflow: TextOverflow.visible);

  TextStyleWithContext? get sm => this?.copyWith(
        fontSize: this?.context.textTheme.bodySmall?.fontSize,
      );

  TextStyleWithContext? get md => this?.copyWith(
        fontSize: this?.context.textTheme.bodyMedium?.fontSize,
      );

  TextStyleWithContext? get lg => this?.copyWith(
        fontSize: this?.context.textTheme.bodyLarge?.fontSize,
      );

  TextStyleWithContext? get xl => this?.copyWith(
        fontSize: this?.context.textTheme.titleLarge?.fontSize,
      );

  TextStyleWithContext? get xxl => this?.copyWith(
        fontSize: this?.context.textTheme.headlineSmall?.fontSize,
      );

  TextStyleWithContext? get xxxl => this?.copyWith(
        fontSize: this?.context.textTheme.headlineLarge?.fontSize,
      );

  TextStyle orDefault([TextStyle? textStyle]) =>
      this ?? textStyle ?? const TextStyle();
}
