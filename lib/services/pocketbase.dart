import 'package:fundwise/services/shared_preferences.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pocketbase.g.dart';

@Riverpod(keepAlive: true)
PocketBase pocketbase(Ref ref) {
  final baseUrl = ref.watch(urlBaseProvider);
  final asyncAuthStore = ref.watch(asyncAuthStoreProvider);
  return PocketBase(
    '$baseUrl',
    authStore: asyncAuthStore,
  );
}

@Riverpod(keepAlive: true)
AsyncAuthStore asyncAuthStore(Ref ref) {
  return AsyncAuthStore(
    save: (data) async => ref.read(sharedPreferencesProvider).setString('auth', data),
    clear: () async => ref.read(sharedPreferencesProvider).remove('auth'),
    initial: ref.read(sharedPreferencesProvider).getString('auth'),
  );
}

@Riverpod(keepAlive: true)
class UrlBase extends _$UrlBase {
  static const _key = 'url-base';

  @override
  Uri build() {
    final maybe = ref.watch(sharedPreferencesProvider).getString(_key);
    listenSelf((_, Uri next) async => ref.read(sharedPreferencesProvider).setString(_key, '$next'));
    return Uri.parse(maybe ?? 'http://127.0.0.1:8090');
  }

  void update(String url) {
    final prev = state;
    state = Uri.tryParse(url) ?? prev;
  }
}
