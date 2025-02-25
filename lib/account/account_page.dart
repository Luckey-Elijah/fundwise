import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({required this.path, super.key});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShadCard(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final part in path
                .split('/')
                .where((part) => part.isNotEmpty)) ...[
              ShadButton(child: Text(part)),
            ],
          ],
        ),
      ),
    );
  }
}
