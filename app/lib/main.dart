import 'package:app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Bloc.observer = FundwiseBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final pocketbase = PocketBase(
    'http://127.0.0.1:8090',
    authStore: AsyncAuthStore(
      save: (data) async => prefs.setString('auth', data),
      initial: prefs.getString('auth'),
    ),
  );

  return runApp(
    FundwiseApp(
      pocketbase: pocketbase,
      sharedPreferences: prefs,
    ),
  );
}
