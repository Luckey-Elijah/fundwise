import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:fundwise/services/caching_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'package:flutter/material.dart' show ThemeMode;

part 'theme.g.dart';
part 'theme.mapper.dart';

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
class ThemeController extends _$ThemeController
    with CachedNotifierState<ThemeModel> {
  @override
  ThemeModel build() => cached() ?? ThemeModel(mode: ThemeMode.system);

  void useMode(ThemeMode mode) {
    state = state.copyWith(mode: mode);
  }

  @override
  ClassMapperBase<ThemeModel> mapper() => ThemeModelMapper.ensureInitialized();
}
