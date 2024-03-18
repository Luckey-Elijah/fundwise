import 'package:app/components/primary_header.dart';
import 'package:app/settings/settings_view.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> dashboardRoutes() {
  return {
    '/settings': (BuildContext context) {
      return const SettingsView();
    },
    '/budget': (BuildContext context) {
      return Column(
        children: [
          PrimaryHeader(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Budget',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ],
      );
    },
    '/reports': (BuildContext context) {
      return const Center(
        child: Text('reports'),
      );
    },
    '/accounts': (BuildContext context) {
      return const Center(
        child: Text('accounts'),
      );
    },
  };
}
