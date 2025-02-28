import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:fundwise/theme/color_scheme.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

const cardTheme = ShadCardTheme(padding: EdgeInsets.all(2));

const dividerTheme = ShadDividerTheme(
  verticalMargin: EdgeInsets.zero,
  horizontalMargin: EdgeInsets.zero,
);

final lightTheme = ShadThemeData(
  brightness: Brightness.light,
  colorScheme: FundwiseColorScheme.light(),
  dividerTheme: dividerTheme,
  cardTheme: cardTheme,
);

final darkTheme = ShadThemeData(
  brightness: Brightness.dark,
  colorScheme: FundwiseColorScheme.dark(),
  dividerTheme: dividerTheme,
  cardTheme: cardTheme,
);
