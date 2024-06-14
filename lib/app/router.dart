import 'dart:async';

import 'package:app/app/auth_listenable.dart';
import 'package:app/budget/budget_page.dart';
import 'package:app/dashboard_shell/dashboard_shell.dart';
import 'package:app/login/login_page.dart';
import 'package:app/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'router.g.dart';

@TypedShellRoute<DashboardShellRoute>(
  routes: [
    TypedGoRoute<BudgetsRoute>(path: '/budgets', name: 'Budgets'),
    TypedGoRoute<ReportsRoute>(path: '/reports', name: 'Reports'),
    TypedGoRoute<AccountsRoute>(path: '/accounts', name: 'Accounts'),
    TypedGoRoute<SettingsRoute>(path: '/settings', name: 'Settings'),
    TypedGoRoute<RedirectShellRoute>(path: '/'),
  ],
)
class DashboardShellRoute extends ShellRouteData {
  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return NoTransitionPage(
      child: DashboardShell(
        matchedLocation: state.matchedLocation,
        url: state.uri,
        child: navigator,
      ),
    );
  }
}

class BudgetsRoute extends GoRouteData {
  const BudgetsRoute({this.budgetId});

  final String? budgetId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: BudgetPage());
  }
}

class RedirectShellRoute extends GoRouteData {
  const RedirectShellRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return '/budgets';
  }
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SettingsPage());
  }
}

class AccountsRoute extends GoRouteData {
  const AccountsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(child: Center(child: Text('${state.name}')));
  }
}

class ReportsRoute extends GoRouteData {
  const ReportsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(child: Center(child: Text('${state.name}')));
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final user = context.read<SupabaseClient>().auth.currentUser;
    if (user != null) return '/';
    return null;
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

GoRouter router(Stream<AuthState> onAuthStateChange) {
  final authListenable = AuthListenable(onAuthStateChange);
  return GoRouter(
    initialLocation: '/login',
    refreshListenable: authListenable,
    routes: $appRoutes,
    redirect: (context, state) {
      final user = context.read<SupabaseClient>().auth.currentUser;
      if (user == null) return '/login';
      return null;
    },
  );
}
