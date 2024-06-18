import 'package:app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  final prefs = await SharedPreferences.getInstance();

  final store = AsyncAuthStore(
    save: (String data) async => prefs.setString('pb_auth', data),
    initial: prefs.getString('pb_auth'),
  );

  final pocketbase = PocketBase('', authStore: store);

  return runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PocketBase>.value(value: pocketbase),
        RepositoryProvider<SharedPreferences>.value(value: prefs),
      ],
      child: const FundwiseApp(),
    ),
  );
}
