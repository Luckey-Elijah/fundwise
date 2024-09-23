import 'package:app/budget/budget_page.dart';
import 'package:app/components/components.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class BudgetReadyToAssign extends StatelessWidget {
  const BudgetReadyToAssign({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.primaryContainer,
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r(), style: context.h2.thin),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(6),
            child: BudgetAssignButton(),
          ),
        ],
      ),
    );
  }
}

class BudgetAssignButton extends StatelessWidget {
  const BudgetAssignButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PositionedOverlayBuilder(
      debugLabel: 'BudgetAssignButton',
      anchorBuilder: (context, controller) {
        return TextButton.icon(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(16),
            foregroundColor: context.onTertiaryContainer,
            backgroundColor: context.colorScheme.inversePrimary,
          ),
          iconAlignment: IconAlignment.end,
          label: const Text('Assign'),
          icon: Icon(Icons.arrow_drop_down),
          onPressed: controller.toggle,
        );
      },
      overlayConstraints: const BoxConstraints(maxWidth: 140, maxHeight: 300),
      overlayChildBuilder: (context, controller) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          children: [
            for (var i = 0; i < 10; i++)
              PressableBox(
                style: Style(
                  $box.padding.all(8),
                  $box.margin.all(4),
                  $box.color.white54(),
                  $box.borderRadius(8),
                  $on.hover($box.color.darken(10)),
                ),
                onPress: () {},
                child: StyledText('thing $i'),
              ),
            Align(
              alignment: Alignment.bottomLeft,
              child: CancelButton(onPressed: controller.hide),
            ),
          ],
        );
      },
    );
  }
}
