import 'package:fundwise/services/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remember_username.g.dart';

@riverpod
class RememberUsername extends _$RememberUsername {
  static const _key = 'remember-username';

  @override
  Future<String?> build() async {
    listenSelf((previous, next) {
      final sharedPreferences = ref.read(sharedPreferencesProvider);
      if (next case AsyncData(:final value?)) {
        sharedPreferences.setString(_key, value);
      } else {
        sharedPreferences.remove(_key);
      }
    });

    final remember = ref.watch(sharedPreferencesProvider.select((pref) => pref.getString(_key)));

    return remember;
  }

  void updateUsername(String? value) => state = AsyncData(value);
}
