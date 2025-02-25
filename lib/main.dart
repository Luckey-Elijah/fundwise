import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/home/home_location.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

void main() {
  return runApp(ProviderScope(child: FundwiseApp()));
}

class FundwiseApp extends ConsumerStatefulWidget {
  const FundwiseApp({super.key});

  @override
  ConsumerState<FundwiseApp> createState() => _FundwiseAppState();
}

class _FundwiseAppState extends ConsumerState<FundwiseApp> {
  final router = DuckRouter(initialLocation: HomeLocation());

  @override
  Widget build(BuildContext context) {
    final shadCardTheme = ShadCardTheme(padding: EdgeInsets.all(2));

    return ShadApp.materialRouter(
      routerConfig: router,
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: const ShadSlateColorScheme.light(),
        cardTheme: shadCardTheme,
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: const ShadSlateColorScheme.dark(),
        cardTheme: shadCardTheme,
      ),
      themeMode: ThemeMode.system,
      builder: (context, child) => Material(child: child),
    );
  }
}
