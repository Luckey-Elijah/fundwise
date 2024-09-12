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
            $box.linearGradient.colors([
              Colors.red,
              Colors.orangeAccent,
              Colors.redAccent,
              Colors.orange,
            ]),
            $text.style.color(Colors.white),
          ).animate(),
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
        $box.gradient.linear.colors([
          Colors.green,
          Colors.blue,
          Colors.lightBlueAccent,
          Colors.lightBlue,
          Colors.green,
        ]),
        $on.hover(
          $box.gradient.linear.colors([
            Colors.green,
            Colors.lightBlueAccent,
            Colors.lightBlue,
            Colors.blue,
          ]),
        ),
      ).animate(),
    );
  }
}
