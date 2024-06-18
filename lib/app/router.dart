import 'dart:async';

import 'package:app/app/auth_listenable.dart';
import 'package:app/budget/budget_page.dart';
import 'package:app/components/context_extension.dart';
import 'package:app/dashboard_shell/dashboard_shell.dart';
import 'package:app/login/login_page.dart';
import 'package:app/settings/settings_page.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;
import 'package:go_router/go_router.dart';
import 'package:pocketbase/pocketbase.dart';

FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
  final user = context.pb.authStore.model;
  if (user == null) return '/login';

  return null;
}

GoRouter router(Stream<AuthStoreEvent> onAuthStateChange) {
  final authListenable = AuthListenable(onAuthStateChange);
  usePathUrlStrategy();
  return GoRouter(
    initialLocation: '/login',
    refreshListenable: authListenable,
    redirect: redirect,
    routes: [
      GoRoute(
        path: '/login',
        redirect: (context, state) {
          final user = context.pb.authStore.model;
          if (user != null) return '/';
          return null;
        },
        pageBuilder: (_, __) => const NoTransitionPage(child: LoginPage()),
      ),
      GoRoute(
        path: '/',
        redirect: (context, state) => '/budget',
      ),
      ShellRoute(
        pageBuilder: (context, state, child) => NoTransitionPage(
          child: DashboardShell(
            matchedLocation: state.matchedLocation,
            url: state.uri,
            child: child,
          ),
        ),
        routes: [
          GoRoute(
            path: '/budget',
            name: 'Budget',
            pageBuilder: (_, __) => const NoTransitionPage(child: BudgetPage()),
          ),
          GoRoute(
            path: '/reports',
            name: 'Reports',
            pageBuilder: (_, state) => NoTransitionPage(
              child: Center(child: Text('${state.name}')),
            ),
          ),
          GoRoute(
            path: '/accounts',
            name: 'Accounts',
            pageBuilder: (_, state) => NoTransitionPage(
              child: Center(child: Text('${state.name}')),
            ),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (_, __) => const NoTransitionPage(
              child: SettingsPage(),
            ),
          ),
        ],
      ),
    ],
  );
}
