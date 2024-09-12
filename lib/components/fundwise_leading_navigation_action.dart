import 'package:app/components/fundwise_logo.dart';
import 'package:app/components/logout_button.dart';
import 'package:app/components/positioned_overlay_builder.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class SidebarSettingsButton extends StatelessWidget {
  const SidebarSettingsButton({super.key});

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
                controller.toggle();
              },
              child: const Text('Settings'),
            ),
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
