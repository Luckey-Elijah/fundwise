import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/services/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage.g.dart';

@riverpod
FooBar<T> fooBar<T extends Object>(Ref ref, {required Bar<T> bar}) {
  return FooBar<T>(bar);
}

class FooBar<T extends Object> {
  FooBar(this.bar);
  final Bar<T> bar;
}

class Bar<T extends Object> {}

@riverpod
LocalStorage<T> localStorage<T extends Object>(
  Ref ref, {
  required ClassMapperBase<T> mapper,
}) {
  return LocalStorage(
    classMapperBase: mapper,
    sharedPreferences: ref.watch(sharedPreferencesProvider),
  );
}

class LocalStorage<T extends Object> {
  LocalStorage({
    required ClassMapperBase<T> classMapperBase,
    required SharedPreferencesWithCache sharedPreferences,
  }) : _sharedPreferences = sharedPreferences,
       _mapper = classMapperBase;

  final ClassMapperBase<T> _mapper;
  final SharedPreferencesWithCache _sharedPreferences;

  void Function(T?, T) listener() {
    return (prev, next) async {
      await _sharedPreferences.setString(_mapper.id, _mapper.encodeJson(next));
    };
  }

  T? state() {
    final raw = _sharedPreferences.getString(_mapper.id);
    if (raw == null) return null;
    return _mapper.decodeJson(raw);
  }
}
