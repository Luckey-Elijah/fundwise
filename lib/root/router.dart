import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/account_detail/account_detail_page.dart';
import 'package:fundwise/account_list/account_list_page.dart';
import 'package:fundwise/budget/budget_page.dart';
import 'package:fundwise/login/login_page.dart';
import 'package:fundwise/reports/reports_page.dart';
import 'package:fundwise/root/fundwise_route.dart';
import 'package:fundwise/root/root_page.dart';
import 'package:fundwise/services/pocketbase.dart';
import 'package:fundwise/settings/settings_page.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';
part 'router.gr.dart';

@riverpod
Raw<FundwiseRouter> router(Ref ref) {
  return FundwiseRouter(pocketbase: ref.watch(pocketbaseProvider));
}

@AutoRouterConfig()
class FundwiseRouter extends RootStackRouter {
  FundwiseRouter({required this.pocketbase});

  final PocketBase pocketbase;

  @override
  List<AutoRoute> get routes => [
    FundwiseRoute('/login/', page: LoginRoute.page),
    FundwiseRoute(
      '/',
      page: RootRoute.page,
      initial: true,
      guards: [AuthGuard(pocketbase: pocketbase)],
      children: [
        FundwiseRoute('accounts/', page: AccountListRoute.page),
        FundwiseRoute('accounts/:id', page: AccountDetailRoute.page),
        FundwiseRoute('reports/', page: ReportsRoute.page),
        FundwiseRoute('budgets/', page: BudgetRoute.page, initial: true),
        FundwiseRoute('settings/', page: SettingsRoute.page),
      ],
    ),
  ];
}

class AuthGuard extends AutoRouteGuard {
  AuthGuard({required this.pocketbase});

  final PocketBase pocketbase;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isAuthed = pocketbase.authStore.isValid;

    if (!isAuthed) {
      resolver.redirectUntil(LoginRoute());
      return;
    }

    resolver.next();
  }
}
