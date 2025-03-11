import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/components/builder_background.dart';
import 'package:fundwise/root/router.dart';
import 'package:fundwise/services/auth.dart';
import 'package:fundwise/services/pocketbase.dart';
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

class FundwiseApp extends ConsumerStatefulWidget {
  const FundwiseApp({super.key});

  @override
  ConsumerState<FundwiseApp> createState() => _FundwiseAppState();
}

class _FundwiseAppState extends ConsumerState<FundwiseApp> {
  late final router = FundwiseRouter(
    authStore: ref.watch(pocketbaseProvider.select((pb) => pb.authStore)),
    preferences: ref.watch(sharedPreferencesProvider),
  );

  @override
  void dispose() {
    router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authenticationProvider, (previous, next) {
      if (!ref.read(pocketbaseProvider).authStore.isValid) {
        router.replaceAll([LoginRoute()]);
      }
    });

    ref.listen(authenticationProvider, (previous, next) {});

    return ShadApp.router(
      routerConfig: router.config(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.watch(themeControllerProvider.select((model) => model.mode)),
      builder: (_, child) => BuilderBackground(child: child),
    );
  }
}
