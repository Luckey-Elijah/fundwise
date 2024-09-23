import 'package:app/components/components.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class SidebarSettingsButton extends StatelessWidget {
  const SidebarSettingsButton({required this.navigateToSettings, super.key});

  final VoidCallback navigateToSettings;

  @override
  Widget build(BuildContext context) {
    return PositionedOverlayBuilder(
      overlayChildBuilder: (context, controller) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LogoutButton(),
            TextButton(
              onPressed: () {
                navigateToSettings();
                controller.toggle();
              },
              child: const Text('Settings'),
            ),
            CancelButton(onPressed: controller.hide),
          ],
        ),
      ),
      anchorBuilder: (context, controller) => InkWell(
        onTap: () => controller.toggle(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 96) {
                return const Center(child: FundwiseLogo());
              }
              return Row(
                children: [
                  const FundwiseLogo(),
                  const GutterSmall(),
                  Flexible(
                    child: Text(
                      'account+user@fundwise.dev',
                      style: context.p.lg.thin,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
