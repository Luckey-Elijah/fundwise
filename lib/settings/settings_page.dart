import 'package:app/dashboard_shell/logout_button.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        LogoutButton(),
      ],
    );
  }
}
