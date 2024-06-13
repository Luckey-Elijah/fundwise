// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $dashboardShellRoute,
      $loginRoute,
    ];

RouteBase get $dashboardShellRoute => ShellRouteData.$route(
      factory: $DashboardShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/budgets',
          name: 'Budgets',
          factory: $BudgetsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/reports',
          name: 'Reports',
          factory: $ReportsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/accounts',
          name: 'Accounts',
          factory: $AccountsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/settings',
          name: 'Settings',
          factory: $SettingsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/',
          factory: $RedirectShellRouteExtension._fromState,
        ),
      ],
    );

extension $DashboardShellRouteExtension on DashboardShellRoute {
  static DashboardShellRoute _fromState(GoRouterState state) =>
      DashboardShellRoute();
}

extension $BudgetsRouteExtension on BudgetsRoute {
  static BudgetsRoute _fromState(GoRouterState state) => BudgetsRoute(
        budgetId: state.uri.queryParameters['budget-id'],
      );

  String get location => GoRouteData.$location(
        '/budgets',
        queryParams: {
          if (budgetId != null) 'budget-id': budgetId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ReportsRouteExtension on ReportsRoute {
  static ReportsRoute _fromState(GoRouterState state) => const ReportsRoute();

  String get location => GoRouteData.$location(
        '/reports',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountsRouteExtension on AccountsRoute {
  static AccountsRoute _fromState(GoRouterState state) => const AccountsRoute();

  String get location => GoRouteData.$location(
        '/accounts',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RedirectShellRouteExtension on RedirectShellRoute {
  static RedirectShellRoute _fromState(GoRouterState state) =>
      const RedirectShellRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
