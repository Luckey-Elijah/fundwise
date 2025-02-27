import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferencesWithCache;

export 'package:shared_preferences/shared_preferences.dart' show SharedPreferencesWithCache;

part 'shared_preferences.g.dart';

@riverpod
SharedPreferencesWithCache sharedPreferences(Ref ref) =>
    throw UnimplementedError('SharedPreferences');
