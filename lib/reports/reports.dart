import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Box(
          style: Style(
            $box.height(40),
            $text.style.color($material.colorScheme.onBackground()),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              TextButton(
                onPressed: () {},
                child: const StyledText('Spending Breakdown'),
              ),
              TextButton(
                onPressed: () {},
                child: const StyledText('Spending Trends'),
              ),
              TextButton(
                onPressed: () {},
                child: const StyledText('Net Worth'),
              ),
              TextButton(
                onPressed: () {},
                child: const StyledText('Income v Expense'),
              ),
            ],
          ),
        ),
        const Divider(),
        const Flexible(
          child: Row(
            children: [
              Flexible(
                child: Content(),
              ),
              Flexible(
                child: Content(),
              ),
            ],
          ),
        ),
        const Flexible(
          child: Row(
            children: [
              Flexible(child: Content()),
              Flexible(child: Content()),
              Flexible(
                child: Column(
                  children: [
                    Flexible(child: Content()),
                    Flexible(child: Content()),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Flexible(child: Content()),
      ],
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Box(
      style: Style(
        $box.borderRadius.all.circular(24),
        $box.margin.all(16),
        $box.color.lightBlue(),
        $box.gradient.radial.radius(2),
        $box.gradient.radial.stops.call([0.25, 0.75]),
        $box.gradient.radial.colors([
          $material.colorScheme.primary(),
          $material.colorScheme.secondary(),
        ]),
        $on.hover(
          $box.gradient.radial.colors([
            $material.colorScheme.secondary(),
            $material.colorScheme.primary(),
          ]),
          $box.gradient.radial.center(Alignment.bottomRight),
        ),
        $box.gradient.radial.center(Alignment.topLeft),
      ).animate(curve: Curves.easeOutCubic, duration: Durations.medium1),
    );
  }
}
