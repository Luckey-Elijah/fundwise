import 'package:auto_route/auto_route.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fundwise/account_detail/account_detail_page.dart';
import 'package:fundwise/account_list/account_list_page.dart';
import 'package:fundwise/budget/budget_detail_page.dart';
import 'package:fundwise/budget/budget_shell_page.dart';
import 'package:fundwise/budget_new/budget_new_page.dart';
import 'package:fundwise/login/login_page.dart';
import 'package:fundwise/reports/reports_page.dart';
import 'package:fundwise/root/fundwise_route.dart';
import 'package:fundwise/root/root_page.dart';
import 'package:fundwise/services/shared_preferences.dart';
import 'package:fundwise/settings/settings_page.dart';
import 'package:pocketbase/pocketbase.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class FundwiseRouter extends RootStackRouter {
  FundwiseRouter({required this.authStore, required this.preferences});

  final AuthStore authStore;
  final SharedPreferencesWithCache preferences;

  @override
  List<AutoRoute> get routes => [
    FundwiseRoute('/login/', page: LoginRoute.page),
    FundwiseRoute(
      '/',
      page: RootRoute.page,
      initial: true,
      guards: [AuthGuard(authStore: authStore)],
      children: [
        FundwiseRoute('accounts/', page: AccountListRoute.page),
        FundwiseRoute('accounts/:id', page: AccountDetailRoute.page),
        FundwiseRoute('reports/', page: ReportsRoute.page),
        FundwiseRoute(
          'budget/',
          page: BudgetShellRoute.page,
          children: [
            FundwiseRoute(':id', page: BudgetDetailRoute.page),
            FundwiseRoute('new', page: BudgetNewRoute.page),
          ],
        ),
        FundwiseRoute('settings/', page: SettingsRoute.page),
      ],
    ),
  ];
}

class AuthGuard extends AutoRouteGuard {
  AuthGuard({required this.authStore});

  final AuthStore authStore;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isAuthed = authStore.isValid;

    if (!isAuthed) {
      resolver.redirectUntil(LoginRoute());
      return;
    }

    resolver.next();
  }
}
