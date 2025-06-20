import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferencesWithCache;

export 'package:shared_preferences/shared_preferences.dart' show SharedPreferencesWithCache;

part 'shared_preferences.g.dart';

final _unimplemented = UnimplementedError('SharedPreferencesWithCache');

@Riverpod(keepAlive: true)
SharedPreferencesWithCache sharedPreferences(Ref ref) => throw _unimplemented;
