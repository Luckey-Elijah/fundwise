import 'package:app/components/fundwise_logo.dart';
import 'package:app/components/positioned_overlay_builder.dart';
import 'package:app/dashboard_shell/logout_button.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class FundwiseLeadingNavigationAction extends StatelessWidget {
  const FundwiseLeadingNavigationAction({super.key});

  @override
  Widget build(BuildContext context) {
    return PositionedOverlayBuilder(
      overlayChildBuilder: (context, controller) => const LogoutButton(),
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
