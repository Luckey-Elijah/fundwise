import 'package:app/account_summaries/account_summaries.dart';
import 'package:app/accounts/accounts_location.dart';
import 'package:app/budget/budget_location.dart';
import 'package:app/components/scaffold.dart';
import 'package:app/current_location/current_location.dart';
import 'package:app/reports/reports_location.dart';
import 'package:app/router/router.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLocation extends StatefulLocation {
  @override
  StatefulLocationBuilder get childBuilder {
    return (BuildContext context, DuckShell shell) {
      return FundwiseResponsiveScaffold(
        sidebarLeading: (context, expanded) {
          final location = context.watch<CurrentLocationCubit>().state;
          return BlocProvider(
            create: (_) =>
                AccountSummariesBloc()..add(AccountSummariesInitialize()),
            child: SidebarLeading(
              expanded: expanded,
              location: location,
            ),
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
        const ReportsLocation(),
      ];

  @override
  String get path => '/';
}
