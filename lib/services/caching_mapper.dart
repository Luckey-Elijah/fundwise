import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/services/auth.dart';
import 'package:fundwise/services/shared_preferences.dart';

mixin CachedAsyncNotifierState<T extends Object> on AutoDisposeAsyncNotifier<T> {
  @protected
  ClassMapperBase<T> mapper();

  T? cached({
    void Function(Object error, StackTrace stackTrace)? listenOnError,
    bool Function(AsyncValue<T>? previous, AsyncValue<T> next)? storeWhen,
    bool clearOnAuth = true,
  }) {
    late final store = CachingMapper<T, AsyncValue<T>>(
      classMapperBase: mapper(),
      sharedPreferences: ref.watch(sharedPreferencesProvider),
      toState: AsyncData.new,
      storeWhen: (previous, next) {
        final maybe = storeWhen?.call(previous, next);
        late final fallback = previous?.value != next.value && next.hasValue;
        return maybe ?? fallback;
      },
    );

    ref.listen(authenticationProvider, (previous, next) {
      if (!clearOnAuth) return;
      if (next is AsyncLoading) return;
      if (next case AsyncData(:final value) when value != null) return;
      store.clear();
    });

    listenSelf(store.listener(), onError: listenOnError);

    final cache = store.state();
    if (cache != null) return cache.valueOrNull;
    return null;
  }
}

mixin CachedNotifierState<T extends Object> on AutoDisposeNotifier<T> {
  @protected
  ClassMapperBase<T> mapper();

  T? cached({
    void Function(Object error, StackTrace stackTrace)? listenOnError,
    bool Function(T? previous, T next)? storeWhen,

    bool clearOnAuth = true,
  }) {
    late final store = CachingMapper<T, T>(
      classMapperBase: mapper(),
      sharedPreferences: ref.watch(sharedPreferencesProvider),
      storeWhen: (previous, next) => storeWhen?.call(previous, next) ?? previous != next,
      toState: (mapper) => mapper,
    );
    ref.listen(authenticationProvider, (previous, next) {
      if (!clearOnAuth) return;
      if (next is AsyncLoading) return;
      if (next case AsyncData(:final value) when value != null) return;
      store.clear();
    });
    listenSelf(store.listener(), onError: listenOnError);
    final cache = store.state();

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
        if (next case AsyncValue<Mapper>(:final value)) {
          final json = _mapper.encodeJson(value);
          await _sharedPreferences.setString(key, json);
        } else {
          final json = _mapper.encodeJson(next);
          await _sharedPreferences.setString(key, json);
        }
      }
    };
  }

  final bool Function(State? previous, State next) storeWhen;
  final State Function(Mapper mapper) toState;

  void clear() => _sharedPreferences.remove(key);

  State? state() {
    final json = _sharedPreferences.getString(key);
    if (json == null) return null;
    return toState(_mapper.decodeJson(json));
  }
}
