import 'package:app/components/components.dart';
import 'package:app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  onPressed: () {
                    context.read<AuthenticationRepository>().signOut();
                    // context.navigate(to: LoginLocation(), root: true);
                  },
                  child: const Text('Logout'),
                ),
                CancelButton(onPressed: controller.hide),
              ],
            ),
          ],
        );
      },
    );
  }
}
