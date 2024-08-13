import 'package:app/budget/ui/budget_page.dart';
import 'package:app/budget_new/budget_new.dart';
import 'package:app/budget_select/budget_select_bloc.dart';
import 'package:app/components/scaffold.dart';
import 'package:app/dashboard_shell/dashboard_shell.dart';
import 'package:app/login/login_page.dart';
import 'package:app/repository/auth_store.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';

class AuthenticationLocationInterceptor extends LocationInterceptor {
  AuthenticationLocationInterceptor(this.authenticationStore);

  final AuthenticationStore authenticationStore;

  @override
  Location? execute(Location to, Location? from) {
    if (authenticationStore.user != null) {
      return null;
    }
    return LoginLocation();
  }
}

class LoginLocationInterceptor extends LocationInterceptor {
  LoginLocationInterceptor(this.authenticationStore);

  final AuthenticationStore authenticationStore;

  @override
  Location? execute(Location to, Location? from) {
    if (from is LoginLocation &&
        to is! LoginLocation &&
        authentication$.user == null) {
      return LoginLocation();
    }
    return null;
  }
}

class BudgetLocationInterceptor extends LocationInterceptor {
  @override
  Location? execute(Location to, Location? from) {
    final state = budgetSelectBloc$.state;
    if (to is BudgetLocation &&
        to.id == null &&
        state is DefaultBudgetSelected) {
      return BudgetLocation(id: state.budget.id);
    }
    return null;
  }
}

final DuckRouter duckRouter = DuckRouter(
  initialLocation: HomeLocation(),
  interceptors: [
    AuthenticationLocationInterceptor(authentication$),
    LoginLocationInterceptor(authentication$),
    BudgetLocationInterceptor(),
  ],
);

class HomeLocation extends StatefulLocation {
  @override
  StatefulLocationBuilder get childBuilder => _builder;

  Widget _builder(BuildContext context, DuckShell shell) {
    return FundwiseResponsiveScaffold(
      sidebarLeading: (context, expanded) {
        return SidebarLeading(
          expanded: expanded,
          matchedLocation: '',
        );
      },
      sidebarLeadingCollapseButton: (context, toggle, expanded) {
        return ExpandButton(expanded: expanded, onPressed: toggle);
      },
      body: (context) => shell,
    );
  }

  @override
  List<Location> get children => [
        const BudgetLocation(),
        const AccountsLocation(),
        const ReportingLocation(),
      ];

  @override
  String get path => '/';
}

class AccountsLocation extends Location {
  const AccountsLocation({this.id});
  final String? id;

  @override
  LocationBuilder? get builder => id == null ? _builder : _builderId;

  Widget _builder(BuildContext context) => const Placeholder();
  Widget _builderId(BuildContext context) => const Placeholder();

  @override
  String get path => id == null ? '/accounts' : '/accounts/$id';
}

class BudgetNewPageLocation extends Location {
  const BudgetNewPageLocation();

  @override
  LocationBuilder? get builder => _builder;

  Widget _builder(BuildContext context) => const BudgetNewPage();

  @override
  String get path => '/budget/new';
}

class ReportingLocation extends Location {
  const ReportingLocation();
  @override
  LocationBuilder? get builder => _builder;

  Widget _builder(BuildContext context) => const Placeholder();

  @override
  String get path => '/reports';
}

class LoginLocation extends Location {
  @override
  LocationBuilder? get builder => _builder;

  Widget _builder(BuildContext context) => const LoginPage();

  @override
  String get path => '/login';
}

class BudgetLocation extends Location {
  const BudgetLocation({this.id});

  final String? id;

  @override
  LocationBuilder? get builder => _builder;

  Widget _builder(BuildContext context) {
    final id = this.id;
    if (id != null) return BudgetPage(id: id);
    return const BudgetLandingPage();
  }

  @override
  String get path => id == null ? '/budget' : '/budget/$id';
}
