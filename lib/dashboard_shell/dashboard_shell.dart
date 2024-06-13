import 'package:app/logout_button.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:go_router/go_router.dart';

class DashboardShell extends StatelessWidget {
  const DashboardShell({
    required this.child,
    required this.matchedLocation,
    required this.url,
    super.key,
  });

  final String matchedLocation;
  final Widget child;
  final Uri url;

  @override
  Widget build(BuildContext context) {
    final index = selectedIndex(matchedLocation);
    return Column(
      children: [
        if (kDebugMode) TopBarNavigator(url: url),
        Expanded(child: PrimaryScaffold(index: index, child: child)),
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

class PrimaryScaffold extends StatelessWidget {
  const PrimaryScaffold({
    required this.child,
    required this.index,
    super.key,
  });

  final Widget child;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      internalAnimations: false,
      onSelectedIndexChange: (int index) {
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
      // secondaryBody: (context) => const BudgetSidebar(),
      transitionDuration: Durations.short3,
      trailingNavRail: const LogoutButton(),
      selectedIndex: index,
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
}

class TopBarNavigator extends StatelessWidget {
  const TopBarNavigator({required this.url, super.key});
  final Uri url;

  @override
  Widget build(BuildContext context) {
    final segments = url.pathSegments;
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.inversePrimary,
      child: Row(
        children: [
          for (var i = 0; i < segments.length; i++)
            TextButton(
              onPressed: () => debugPrint('/${segments.take(i + 1).join('/')}'),
              child: Row(
                children: [
                  const Text('/'),
                  const GutterTiny(),
                  Text(segments[i]),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
