import 'dart:developer';

import 'package:app/app/animated_splash.dart';
import 'package:app/budget/ui/budget_page.dart';
import 'package:app/budget_new/budget_new.dart';
import 'package:app/components/scaffold.dart';
import 'package:app/dashboard_shell/dashboard_shell.dart';
import 'package:app/login/login_page.dart';
import 'package:app/reports/reports.dart';
import 'package:app/repository/auth_store.dart';
import 'package:app/router/custom_pages.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flutter/material.dart';

class AuthenticationLocationInterceptor extends LocationInterceptor {
  AuthenticationLocationInterceptor(this.authenticationStore);

  final AuthenticationStore authenticationStore;

  @override
  Location? execute(Location to, Location? from) {
    if (authenticationStore.user != null) {
      if (to is SplashLocation) {
        return HomeLocation();
      }
      return null;
    }
    return LoginLocation();
  }
}

class LoginLocationInterceptor extends LocationInterceptor {
  LoginLocationInterceptor(this.auth);

  final AuthenticationStore auth;

  @override
  Location? execute(Location to, Location? from) {
    if (from is LoginLocation && to is! LoginLocation && auth.user == null) {
      return LoginLocation();
    }
    return null;
  }
}

class SplashLocation extends Location {
  @override
  LocationBuilder? get builder => (_) => const AnimatedSplash();

  @override
  String get path => '/splash';
}

DuckRouter duckRouter({
  required AuthenticationStore auth,
}) =>
    DuckRouter(
      initialLocation: SplashLocation(),
      interceptors: [
        LoggingLocationInterceptor(),
        AuthenticationLocationInterceptor(auth),
        LoginLocationInterceptor(auth),
      ],
    );

class LoggingLocationInterceptor extends LocationInterceptor {
  @override
  Location? execute(Location to, Location? from) {
    log('${from?.path} -> ${to.path}', name: 'to | from');

    return null;
  }
}

class HomeLocation extends StatefulLocation {
  @override
  StatefulLocationBuilder get childBuilder {
    return (BuildContext context, DuckShell shell) {
      return FundwiseResponsiveScaffold(
        sidebarLeading: (context, expanded) {
          return SidebarLeading(
            expanded: expanded,
            matchedLocation: '',
          );
        },
        body: (context) => shell,
      );
    };
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
  LocationPageBuilder? get pageBuilder {
    return (context, p) => NoTransitionPage(
          name: path,
          child: _builder(context),
        );
  }

  Widget _builder(BuildContext context) => const Placeholder();

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
  LocationPageBuilder? get pageBuilder {
    return (context, p) => NoTransitionPage(
          name: path,
          child: _builder(context),
        );
  }

  Widget _builder(BuildContext context) => const ReportsPage();

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
  LocationPageBuilder? get pageBuilder {
    return (context, p) => NoTransitionPage(
          name: path,
          child: _builder(context),
        );
  }

  Widget _builder(BuildContext context) {
    final id = this.id;
    if (id != null) return BudgetPage(id: id);
    return const BudgetLandingPage();
  }

  @override
  String get path => id == null ? '/budget' : '/budget/$id';
}
