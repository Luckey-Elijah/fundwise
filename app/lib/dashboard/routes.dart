import 'package:app/components/primary_header.dart';
import 'package:app/settings/settings_view.dart';
import 'package:app/utility/build_context.extension.dart';
import 'package:flutter/material.dart';

enum BudgetRoutes {
  settings('/settings'),
  budget('/budget'),
  reports('/reports'),
  accounts('/accounts'),
  ;

  const BudgetRoutes(this.path);

  final String path;

  static String get initialRoute => BudgetRoutes.settings.path;

  static Map<String, WidgetBuilder> routes() => {
        for (final route in BudgetRoutes.values)
          route.path: switch (route) {
            BudgetRoutes.settings => (context) => const SettingsView(),
            BudgetRoutes.budget => (BuildContext context) {
                return Column(
                  children: [
                    PrimaryHeader(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Budget',
                            style: context.textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            BudgetRoutes.reports => (BuildContext context) {
                return const Center(
                  child: Text('reports'),
                );
              },
            BudgetRoutes.accounts => (BuildContext context) {
                return const Center(
                  child: Text('accounts'),
                );
              },
          },
      };
}
