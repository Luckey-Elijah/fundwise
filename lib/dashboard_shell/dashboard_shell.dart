import 'package:app/dashboard_shell/logout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
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
    return PrimaryScaffold(
      key: ValueKey(index),
      index: index,
      child: child,
    );
  }

  int? selectedIndex(String matchedLocation) {
    const io = ['/budget', '/reports', '/accounts'];
    for (var i = 0; i < io.length; i++) {
      if (matchedLocation.startsWith(io[i])) return i;
    }
    return null;
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
        const io = ['/budget', '/reports', '/accounts'];
        if (index > io.length) return context.go('/404');
        context.go(io[index]);
      },
      body: (context) => child,
      leadingExtendedNavRail: TextButton.icon(
        onPressed: () => context.go('/settings'),
        iconAlignment: IconAlignment.end,
        label: const Text('Account'),
        icon: const Icon(Icons.lightbulb),
      ),
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
