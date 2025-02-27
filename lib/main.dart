import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/root/router.dart';
import 'package:fundwise/services/shared_preferences.dart';
import 'package:fundwise/services/theme.dart';
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
    final shadCardTheme = ShadCardTheme(padding: EdgeInsets.all(2));

    return ShadApp.router(
      routerConfig: router.config(),
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
      themeMode: ref.watch(themeControllerProvider.select((it) => it.mode)),
      builder: (context, child) {
        final color = ShadTheme.of(context).colorScheme.background;
        return ColoredBox(color: color, child: SizedBox.expand(child: child));
      },
    );
  }
}
