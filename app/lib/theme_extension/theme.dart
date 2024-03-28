import 'package:app/theme_extension/decoration.dart';
import 'package:app/theme_extension/margin.dart';
import 'package:flutter/material.dart';

export 'package:app/theme_extension/decoration.dart';
export 'package:app/theme_extension/margin.dart';

ThemeData theme(ThemeData theme) {
  final br = BorderRadius.circular(4);

  return theme.copyWith(
    checkboxTheme: const CheckboxThemeData(
      side: BorderSide.none,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FundwiseTransition(),
        TargetPlatform.fuchsia: FundwiseTransition(),
        TargetPlatform.iOS: FundwiseTransition(),
        TargetPlatform.macOS: FundwiseTransition(),
      },
    ),
    appBarTheme: const AppBarTheme(
      toolbarHeight: kToolbarHeight + 12,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
      ),
    ),
    extensions: [
      const MarginThemeExtension(
        small: Size.square(4),
        medium: Size.square(8),
        large: Size.square(16),
      ),
      DecorationTheme(
        primary: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: br,
        ),
        error: BoxDecoration(
          color: theme.colorScheme.errorContainer,
          borderRadius: br,
        ),
        borderRadius: br,
        largeWidth: BoxConstraints.loose(const Size.fromWidth(960)),
        mediumWidth: BoxConstraints.loose(const Size.fromWidth(640)),
        smallWidth: BoxConstraints.loose(const Size.fromWidth(320)),
      ),
    ],
  );
}

class FundwiseTransition extends PageTransitionsBuilder {
  const FundwiseTransition();
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
      child: child,
    );
  }
}
