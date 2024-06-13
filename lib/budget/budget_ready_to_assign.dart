import 'package:app/budget/budget_page.dart';
import 'package:app/positioned_overlay_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class BudgetReadyToAssign extends StatelessWidget {
  const BudgetReadyToAssign({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r(), style: Theme.of(context).textTheme.headlineSmall),
                  Text(
                    'Ready to assign',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
          ),
          const Gutter(),
          PositionedOverlayBuilder(
            anchorBuilder: (context, controller, child) {
              return TextButton.icon(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  foregroundColor:
                      Theme.of(context).colorScheme.onTertiaryContainer,
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                ),
                iconAlignment: IconAlignment.end,
                label: child,
                icon: const Icon(Icons.arrow_drop_down),
                onPressed: controller.toggle,
              );
            },
            overlayBuilder: (context, controller) {
              return Card(
                elevation: 10,
                child: Column(
                  children: [
                    for (var i = 0; i < 10; i++) Text('thing $i'),
                  ],
                ),
              );
            },
            child: const Text('Assign'),
          ),
          // TextButton.icon(
          //   style: TextButton.styleFrom(
          //     padding: const EdgeInsets.all(16),
          //     shape: const RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(8)),
          //     ),
          //     foregroundColor:
          //         Theme.of(context).colorScheme.onTertiaryContainer,
          //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          //   ),
          //   iconAlignment: IconAlignment.end,
          //   label: const Text('Assign'),
          //   icon: const Icon(Icons.arrow_drop_down),
          //   onPressed: () {},
          // ),
          const Gutter(),
        ],
      ),
    );
  }
}
