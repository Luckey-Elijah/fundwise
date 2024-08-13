import 'package:app/app/router.dart';
import 'package:flutter/material.dart';

class FundwiseApp extends StatefulWidget {
  const FundwiseApp({super.key});

  @override
  State<FundwiseApp> createState() => _FundwiseAppState();
}

class _FundwiseAppState extends State<FundwiseApp> {
  // late final _router = router(authentication$.stream);
  late final _router = duckRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      routerConfig: _router,
    );
  }

  ThemeData get lightTheme {
    const defaultElevation = WidgetStatePropertyAll<double>(0);

    final defaultShape = WidgetStatePropertyAll(
      ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );

    const defaultPadding = WidgetStatePropertyAll(EdgeInsets.all(16));

    return ThemeData(
      colorScheme: _scheme,
      visualDensity: VisualDensity.comfortable,
      useMaterial3: true,
    ).copyWith(
      dialogTheme: DialogTheme(
        shape: defaultShape.value,
        insetPadding: defaultPadding.value,
      ),
      splashFactory: NoSplash.splashFactory,
      cardTheme: CardTheme(
        elevation: defaultElevation.value,
        shape: defaultShape.value,
      ),
      dividerTheme: const DividerThemeData(space: 0),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: defaultElevation,
          padding: defaultPadding,
          shape: defaultShape,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(elevation: defaultElevation, shape: defaultShape),
      ),
    );
  }
}

const _scheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff386a20),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffb7f397),
  onPrimaryContainer: Color(0xff0f140d),
  secondary: Color(0xff55624c),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffd9e7cb),
  onSecondaryContainer: Color(0xff121311),
  tertiary: Color(0xff19686a),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffa8eff0),
  onTertiaryContainer: Color(0xff0e1414),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff141212),
  surface: Color(0xfff9faf8),
  onSurface: Color(0xff090909),
  surfaceContainerHighest: Color(0xffe4e6e2),
  onSurfaceVariant: Color(0xff111211),
  outline: Color(0xff7c7c7c),
  outlineVariant: Color(0xffc8c8c8),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff121311),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xffbbdeab),
  surfaceTint: Color(0xff386a20),
);
