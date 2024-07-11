import 'package:app/app/router.dart';
import 'package:app/repository/auth_store.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class FundwiseApp extends StatefulWidget {
  const FundwiseApp({super.key});

  @override
  State<FundwiseApp> createState() => _FundwiseAppState();
}

class _FundwiseAppState extends State<FundwiseApp> {
  late final _router = router(authentication$.stream);

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
    return FlexThemeData.light(
      scheme: FlexScheme.dellGenoa,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        elevatedButtonRadius: 8,
        blendOnLevel: 10,
        blendOnColors: false,
        useTextTheme: true,
        useM2StyleDividerInM3: true,
        alignedDropdown: true,
        useInputDecoratorThemeInDialogs: true,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      swapLegacyOnMaterial3: true,
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
