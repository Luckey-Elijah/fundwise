import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/services/shared_preferences.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pocketbase.g.dart';

@riverpod
PocketBase pocketbase(Ref ref) {
  return PocketBase(
    'http://127.0.0.1:8090',
    authStore: AsyncAuthStore(
      save: (data) async {
        await ref.read(sharedPreferencesProvider).setString('auth', data);
      },
      clear: () async {
        await ref.read(sharedPreferencesProvider).remove('auth');
      },
      initial: ref.read(sharedPreferencesProvider).getString('auth'),
    ),
  );
}
