import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({required this.path, super.key});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Center(child: ShadButton(child: Text(path), onPressed: () {}));
  }
}
