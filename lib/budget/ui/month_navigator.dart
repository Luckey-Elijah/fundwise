import 'package:app/components/positioned_overlay_builder.dart';
import 'package:app/repository/date_store.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:intl/intl.dart';

class BudgetMonthNavigator extends StatelessWidget {
  const BudgetMonthNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat('MMM').format;

    return Row(
      children: [
        IconButton.outlined(
          iconSize: 32,
          onPressed: () {},
          icon: const Icon(Icons.chevron_left),
        ),
        Column(
          children: [
            StreamBuilder(
              stream: date$.stream,
              builder: (context, snapshot) => PositionedOverlayBuilder(
                overlayConstraints: const BoxConstraints(
                  maxWidth: 480,
                  maxHeight: 310,
                ),
                anchorBuilder: (context, controller) => TextButton.icon(
                  onPressed: controller.toggle,
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(Icons.arrow_drop_down),
                  label: Text(
                    DateFormat("MMM ''yy")
                        .format(
                          switch (snapshot) {
                            AsyncSnapshot(:final DateTime data) => data,
                            _ => DateTime.now(),
                          },
                        )
                        .toUpperCase(),
                    style: context.h3.wide.thin,
                  ),
                ),
                overlayChildBuilder: (context, controller) {
                  Color? backgroundColor(DateTime date) {
                    if (date.month == date.month && date.year == date.year) {
                      return context.primaryContainer;
                    }

                    if (date.isBefore(date)) {
                      return context.primaryContainer.withOpacity(0.3);
                    }

                    return context.secondaryContainer.withOpacity(0.5);
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton.outlined(
                              iconSize: 24,
                              onPressed: () {},
                              icon: const Icon(Icons.chevron_left),
                            ),
                            const Spacer(),
                            Text(
                              DateFormat('yyyy')
                                  .format(
                                    switch (snapshot) {
                                      AsyncSnapshot(:final DateTime data) =>
                                        data,
                                      _ => DateTime.now(),
                                    },
                                  )
                                  .toUpperCase(),
                              style: context.h3.wide.thin,
                            ),
                            const Spacer(),
                            IconButton.outlined(
                              iconSize: 24,
                              onPressed: () {},
                              icon: const Icon(Icons.chevron_right),
                            ),
                            const Gutter(),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: context.primaryContainer,
                              ),
                              onPressed: () {},
                              child: Text(
                                'today',
                                style: context.p.thin.onPrimary,
                              ),
                            ),
                          ],
                        ),
                        const GutterSmall(),
                        Expanded(
                          child: GridView.count(
                            childAspectRatio: 1.5,
                            crossAxisCount: 4,
                            shrinkWrap: true,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            children: [
                              ...List.generate(
                                DateTime.monthsPerYear,
                                (i) => DateTime(2024, i + 1),
                              ).map(
                                (date) => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: backgroundColor(date),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    fmt(date).toUpperCase(),
                                    style: date.month == date.month
                                        ? context.p.wide.thin.onTertiary
                                        : context.p.wide.thin,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text('Enter a note...', style: context.p.sm),
              ),
            ),
          ],
        ),
        IconButton.outlined(
          iconSize: 32,
          onPressed: () {},
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
