import 'package:dart_mappable/dart_mappable.dart';
import 'package:fundwise/components/material.dart';
import 'package:fundwise/services/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_controller.g.dart';
part 'theme_controller.mapper.dart';

class ThemeModeMapper extends SimpleMapper<ThemeMode> {
  const ThemeModeMapper();

  @override
  ThemeMode decode(dynamic value) {
    for (final element in ThemeMode.values) {
      if (element.name == value) return element;
    }

    throw FormatException('$value cannot be mapped the [ThemeMode].');
  }

  @override
  dynamic encode(ThemeMode self) => self.name;
}

@MappableClass(includeCustomMappers: [ThemeModeMapper()])
class ThemeModel with ThemeModelMappable {
  const ThemeModel({required this.mode});

  final ThemeMode mode;
}

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeModel build() {
    final mapper = ThemeModelMapper.ensureInitialized();
    final pref = ref.watch(sharedPreferencesProvider);
    listenSelf((_, next) => pref.setString(mapper.id, next.toJson()));
    final json = pref.getString(mapper.id);
    ThemeModel? cached;
    if (json != null) cached = ThemeModelMapper.fromJson(json);
    return cached ?? const ThemeModel(mode: ThemeMode.system);
  }

  void useMode(ThemeMode mode) {
    state = state.copyWith(mode: mode);
  }
}
