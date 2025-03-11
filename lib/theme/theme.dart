import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:fundwise/theme/color_scheme.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const cardTheme = ShadCardTheme(padding: EdgeInsets.all(2));

const separatorTheme = ShadSeparatorTheme(
  verticalMargin: EdgeInsets.zero,
  horizontalMargin: EdgeInsets.zero,
);

final lightTheme = ShadThemeData(
  brightness: Brightness.light,
  colorScheme: FundwiseColorScheme.light(),
  separatorTheme: separatorTheme,
  cardTheme: cardTheme,
);

final darkTheme = ShadThemeData(
  brightness: Brightness.dark,
  colorScheme: FundwiseColorScheme.dark(),
  separatorTheme: separatorTheme,
  cardTheme: cardTheme,
);
