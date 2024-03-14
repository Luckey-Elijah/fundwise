import 'dart:convert';

import 'package:app/home/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home.g.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityProvider);
    return Scaffold(
      body: Center(
        child: activity.when<Widget>(
          data: (data) => Text(data.toString()),
          error: (e, __) => Text('$e'),
          loading: CircularProgressIndicator.adaptive,
        ),
      ),
    );
  }
}

@riverpod
Future<Activity> activity(ActivityRef ref) async {
  final response = await http.get(Uri.https('boredapi.com', '/api/activity'));
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return Activity.fromJson(json);
}
