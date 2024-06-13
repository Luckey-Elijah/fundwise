import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

class DashboardShell extends StatelessWidget {
  const DashboardShell({
    required this.child,
    required this.matchedLocation,
    super.key,
  });
  final String matchedLocation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      onSelectedIndexChange: (index) {
        context.go(
          switch (index) {
            0 => '/budgets',
            1 => '/reports',
            2 => '/accounts',
            _ => '/404',
          },
        );
      },
      body: (context) => child,
      leadingExtendedNavRail: const SettingsButton(),
      selectedIndex: selectedIndex(matchedLocation),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.wallet),
          label: 'Budget',
        ),
        NavigationDestination(
          icon: Icon(Icons.bar_chart),
          label: 'Reports',
        ),
        NavigationDestination(
          icon: Icon(Icons.account_balance),
          label: 'Accounts',
        ),
      ],
    );
  }

  int? selectedIndex(String matchedLocation) {
    return switch (matchedLocation) {
      '/budgets' => 0,
      '/reports' => 1,
      '/accounts' => 2,
      _ => null,
    };
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextButton(
          child: const Text('Settings'),
          onPressed: () => context.go('/settings'),
        ),
      ),
    );
  }
}
