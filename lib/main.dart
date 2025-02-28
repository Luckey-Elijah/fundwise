import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/components/builder_background.dart';
import 'package:fundwise/root/router.dart';
import 'package:fundwise/services/shared_preferences.dart';
import 'package:fundwise/theme/theme.dart';
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
    return ShadApp.router(
      routerConfig: router.config(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeControllerProvider.select((model) => model.mode)),
      builder: (_, child) => BuilderBackground(child: child),
    );
  }
}
