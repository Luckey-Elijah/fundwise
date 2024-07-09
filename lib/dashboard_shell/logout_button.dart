import 'package:app/components/positioned_overlay_builder.dart';
import 'package:app/repository/auth_store.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PositionedOverlayBuilder(
      anchorBuilder: (context, controller) {
        return TextButton.icon(
          iconAlignment: IconAlignment.end,
          onPressed: controller.toggle,
          label: const Text('Logout'),
          icon: const Icon(Icons.logout),
        );
      },
      overlayChildBuilder: (context, controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Are you sure?'),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: authentication$.signOut,
                  child: const Text('Logout'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: context.error,
                  ),
                  onPressed: controller.hide,
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
