import 'package:fundwise/services/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remember_username.g.dart';

@riverpod
class RememberUsername extends _$RememberUsername {
  static const _key = 'remember-username';
  @override
  Future<String?> build() async {
    listenSelf((previous, next) {
      if (next case AsyncData(:final value?)) {
        ref.read(sharedPreferencesProvider.select((pref) => pref.setString(_key, value)));
      } else {
        ref.read(sharedPreferencesProvider.select((pref) => pref.remove(_key)));
      }
    });

    final remember = ref.watch(sharedPreferencesProvider.select((pref) => pref.getString(_key)));

    return remember;
  }

  Future<void> updateUsername(String? value) async => state = AsyncData(value);
}
