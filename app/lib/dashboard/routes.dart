import 'package:app/budget/budget_view.dart';
import 'package:app/settings/settings_view.dart';
import 'package:flutter/material.dart';

enum BudgetRoutes {
  settings('/settings'),
  budget('/budget'),
  reports('/reports'),
  accounts('/accounts'),
  ;

  const BudgetRoutes(this.path);

  final String path;

  static String get initialRoute => BudgetRoutes.budget.path;

  static Map<String, WidgetBuilder> routes() => {
        for (final route in BudgetRoutes.values)
          route.path: switch (route) {
            BudgetRoutes.settings => (_) => const SettingsView(),
            BudgetRoutes.budget => (_) => const BudgetView(),
            BudgetRoutes.reports => (_) => const Center(child: Text('reports')),
            BudgetRoutes.accounts => (_) =>
                const Center(child: Text('accounts')),
          },
      };
}
