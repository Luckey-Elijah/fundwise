import 'package:app/components/context_extension.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
          onPressed: context.supabase.auth.signOut,
          child: const Text('logout'),
        ),
      ],
    );
  }
}
