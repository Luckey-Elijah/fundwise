import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:fundwise/services/local_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';
part 'theme.mapper.dart';

@MappableClass()
class ThemeModel with ThemeModelMappable {
  ThemeModel({required this.mode});

  final ThemeMode mode;
}

@riverpod
class ThemeController extends _$ThemeController {
  @override
  ThemeModel build() {
    final LocalStorage<ThemeModel> localStorage = ref.watch(
      localStorageProvider(mapper: ThemeModelMapper.ensureInitialized()),
    );
    listenSelf(localStorage.listener());
    final maybe = localStorage.state();
    if (maybe != null) return maybe;

    return ThemeModel(mode: ThemeMode.system);
  }
}
