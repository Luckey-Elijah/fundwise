import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fundwise/account_detail/account_detail_page.dart';
import 'package:fundwise/account_list/account_list_page.dart';
import 'package:fundwise/budget/budget_page.dart';
import 'package:fundwise/reports/reports_page.dart';
import 'package:fundwise/root/root_page.dart';
import 'package:fundwise/settings/settings_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';
part 'router.gr.dart';

@riverpod
Raw<FundwiseRouter> router(Ref ref) => FundwiseRouter();

@AutoRouterConfig()
class FundwiseRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    FundwiseRoute(
      '/',
      page: RootRoute.page,
      initial: true,
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

class FundwiseRoute extends CustomRoute<CustomRouteType> {
  FundwiseRoute(
    String path, {
    required super.page,
    super.initial,
    super.children,
  }) : super(
         barrierDismissible: false,

         path: path,
         transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
       );
}
