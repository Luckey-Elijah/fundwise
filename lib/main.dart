import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/components/builder_background.dart';
import 'package:fundwise/root/router.dart';
import 'package:fundwise/services/shared_preferences.dart';
import 'package:fundwise/theme/color_scheme.dart';
import 'package:fundwise/theme/theme_controller.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferencesWithCache.create(
    cacheOptions: SharedPreferencesWithCacheOptions(),
  );

  return runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(sharedPreferences)],
      child: FundwiseApp(),
    ),
  );
}

class FundwiseApp extends ConsumerWidget {
  const FundwiseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    const cardTheme = ShadCardTheme(padding: EdgeInsets.all(2));
    const dividerTheme = ShadDividerTheme(
      verticalMargin: EdgeInsets.zero,
      horizontalMargin: EdgeInsets.zero,
    );

    return ShadApp.router(
      routerConfig: router.config(),
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: FundwiseColorScheme.light(),
        dividerTheme: dividerTheme,
        cardTheme: cardTheme,
      ),
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: FundwiseColorScheme.dark(),
        dividerTheme: dividerTheme,
        cardTheme: cardTheme,
      ),
      themeMode: ref.watch(themeControllerProvider.select((model) => model.mode)),
      builder: (_, child) => BuilderBackground(child: child),
    );
  }
}
