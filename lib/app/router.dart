import 'dart:async';

import 'package:app/accounts/accounts_page.dart';
import 'package:app/app/auth_listenable.dart';
import 'package:app/budget/ui/budget_page.dart';
import 'package:app/budget_new/budget_new.dart';
import 'package:app/dashboard_shell/dashboard_shell.dart';
import 'package:app/login/login_page.dart';
import 'package:app/repository/auth_store.dart';
import 'package:app/settings/settings_page.dart';
import 'package:app/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart' // ignore: depend_on_referenced_packages
    show
        usePathUrlStrategy;
import 'package:go_router/go_router.dart';

String? redirect(BuildContext context, GoRouterState state) {
  final user = authentication$.user;
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
          final user = authentication$.user;
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
            routes: [
              GoRoute(
                path: 'new',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: BudgetNewPage(),
                ),
              ),
              GoRoute(
                path: ':id',
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: BudgetReady(
                      id: state.pathParameters.tryString('id')!,
                    ),
                  );
                },
              ),
            ],
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
            pageBuilder: (_, state) => const NoTransitionPage(
              child: AccountsPage(),
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
