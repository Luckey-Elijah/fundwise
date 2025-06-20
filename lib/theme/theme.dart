import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:fundwise/theme/color_scheme.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const cardTheme = ShadCardTheme(padding: EdgeInsets.all(2));

const separatorTheme = ShadSeparatorTheme(
  verticalMargin: EdgeInsets.zero,
  horizontalMargin: EdgeInsets.zero,
);

const zeroRadiusButtonTheme = ShadButtonTheme(
  // decoration: ShadDecoration(border: ShadBorder(radius: BorderRadius.zero)),
);

final lightTheme = ShadThemeData(
  ghostButtonTheme: zeroRadiusButtonTheme,
  primaryButtonTheme: zeroRadiusButtonTheme,
  brightness: Brightness.light,
  colorScheme: const FundwiseColorScheme.light(),
  separatorTheme: separatorTheme,
  cardTheme: cardTheme,
);

final darkTheme = ShadThemeData(
  outlineButtonTheme: zeroRadiusButtonTheme,
  primaryButtonTheme: zeroRadiusButtonTheme,
  brightness: Brightness.dark,
  colorScheme: const FundwiseColorScheme.dark(),
  separatorTheme: separatorTheme,
  cardTheme: cardTheme,
);
