import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/services/shared_preferences.dart';

mixin CachedAsyncNotifierState<T extends Object>
    on AutoDisposeAsyncNotifier<T> {
  @protected
  ClassMapperBase<T> mapper();

  AsyncValue<T>? cached({
    void Function(Object error, StackTrace stackTrace)? listenOnError,
  }) {
    final store = CachingMapper<T, AsyncValue<T>>(
      classMapperBase: mapper(),
      sharedPreferences: ref.watch(sharedPreferencesProvider),
      toState: AsyncData.new,
      storeWhen: (prev, next) => prev?.value != next.value && next.hasValue,
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

  late final _store = CachingMapper<T, T>(
    classMapperBase: mapper(),
    sharedPreferences: ref.watch(sharedPreferencesProvider),
    storeWhen: (previous, next) => previous != next,
    toState: (mapper) => mapper,
  );

  T? cached({
    void Function(Object error, StackTrace stackTrace)? listenOnError,
  }) {
    listenSelf(_store.listener(), onError: listenOnError);
    final cache = _store.state();

    if (cache != null) return cache;
    return null;
  }
}

class CachingMapper<Mapper extends Object, State extends Object> {
  CachingMapper({
    required ClassMapperBase<Mapper> classMapperBase,
    required SharedPreferencesWithCache sharedPreferences,
    required this.storeWhen,
    required this.toState,
  }) : _sharedPreferences = sharedPreferences,
       _mapper = classMapperBase;

  final ClassMapperBase<Mapper> _mapper;
  final SharedPreferencesWithCache _sharedPreferences;
  late final key = _mapper.id;

  void Function(State?, State) listener() {
    return (prev, next) async {
      if (storeWhen(prev, next)) {
        final json = _mapper.encodeJson(next);
        await _sharedPreferences.setString(key, json);
      }
    };
  }

  final bool Function(State? previous, State next) storeWhen;
  State Function(Mapper mapper) toState;

  State? state() {
    final json = _sharedPreferences.getString(key);
    if (json == null) return null;
    return toState(_mapper.decodeJson(json));
  }
}
