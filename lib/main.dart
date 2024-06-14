import 'package:app/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  final supabase = await Supabase.initialize(
    debug: false,
    url: 'https://burstizdkvwekutqexxj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6I'
        'mJ1cnN0aXpka3Z3ZWt1dHFleHhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTgxMTYzNDk'
        'sImV4cCI6MjAzMzY5MjM0OX0.BSAvx_KvnYR6dxZjsrHYCjay3nXDaXS4IKrorWUIpt8',
  );

  return runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SupabaseClient>.value(value: supabase.client),
      ],
      child: const FundwiseApp(),
    ),
  );
}
