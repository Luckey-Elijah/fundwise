import 'dart:developer';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/services/shared_preferences.dart';

mixin CachedAsyncNotifierState<T extends Object>
    on AutoDisposeAsyncNotifier<T> {
  @protected
  ClassMapperBase<T> mapper();

  T? cached({
    void Function(Object error, StackTrace stackTrace)? listenOnError,
    bool debug = kDebugMode,
  }) {
    final store = AsyncCachingMapper(
      classMapperBase: mapper(),
      sharedPreferences: ref.watch(sharedPreferencesProvider),
    );

    listenSelf(store.listener(), onError: listenOnError);
    final cache = store.state();
    if (cache != null) return cache;
    return null;
  }
}

mixin CachedNotifierState<T extends Object> on AutoDisposeNotifier<T> {
  @protected
  ClassMapperBase<T> mapper();

  T? cached({
    void Function(Object error, StackTrace stackTrace)? listenOnError,
    bool debug = kDebugMode,
  }) {
    final store = CachingMapper(
      classMapperBase: mapper(),
      sharedPreferences: ref.watch(sharedPreferencesProvider),
    );

    listenSelf(store.listener(), onError: listenOnError);

    final cache = store.state();

    if (cache != null) return cache;
    return null;
  }
}

class CachingMapper<T extends Object> {
  CachingMapper({
    required ClassMapperBase<T> classMapperBase,
    required SharedPreferencesWithCache sharedPreferences,
    this.debug = kDebugMode,
  }) : _sharedPreferences = sharedPreferences,
       _mapper = classMapperBase;

  final ClassMapperBase<T> _mapper;
  final SharedPreferencesWithCache _sharedPreferences;
  late final _key = _mapper.id;
  final bool debug;

  void Function(T?, T) listener() {
    return (prev, next) async {
      if (prev == next) return;
      final json = _mapper.encodeJson(next);
      await _sharedPreferences.setString(_key, json);

      if (debug) log(json, name: 'CachingMapper | set | $_key');
    };
  }

  T? state() {
    final json = _sharedPreferences.getString(_key);
    if (json == null) return null;
    if (debug) log(json, name: 'CachingMapper | get | $_key');
    return _mapper.decodeJson(json);
  }
}

class AsyncCachingMapper<T extends Object> {
  AsyncCachingMapper({
    required ClassMapperBase<T> classMapperBase,
    required SharedPreferencesWithCache sharedPreferences,
    this.debug = kDebugMode,
  }) : _sharedPreferences = sharedPreferences,
       _mapper = classMapperBase;

  final ClassMapperBase<T> _mapper;
  final SharedPreferencesWithCache _sharedPreferences;
  late final _key = _mapper.id;
  final bool debug;

  void Function(AsyncValue<T>?, AsyncValue<T>) listener() {
    return (prev, next) async {
      if (next case AsyncData(:final T value) when prev?.value != value) {
        final json = _mapper.encodeJson(value);
        await _sharedPreferences.setString(_key, json);
        if (debug) log(json, name: 'AsyncCachingMapper | set | $_key');
      }
    };
  }

  T? state() {
    final json = _sharedPreferences.getString(_key);
    if (json == null) return null;
    if (debug) log(json, name: 'AsyncCachingMapper | get | $_key');
    return _mapper.decodeJson(json);
  }
}
