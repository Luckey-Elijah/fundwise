import 'package:app/app/router.dart';
import 'package:app/components/context_extension.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class FundwiseApp extends StatefulWidget {
  const FundwiseApp({super.key});

  @override
  State<FundwiseApp> createState() => _FundwiseAppState();
}

class _FundwiseAppState extends State<FundwiseApp> {
  late final _router = router(context.supabase.auth.onAuthStateChange);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      routerConfig: _router,
    );
  }

  ThemeData get lightTheme {
    const dividerThemeData = DividerThemeData(space: 0);
    final textButtonTheme = TextButtonThemeData(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        elevation: const WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
    final elevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        elevation: const WidgetStatePropertyAll(0),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
        shape: WidgetStatePropertyAll(
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );

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
      dividerTheme: dividerThemeData,
      elevatedButtonTheme: elevatedButtonTheme,
      textButtonTheme: textButtonTheme,
    );
  }
}
