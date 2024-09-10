import 'package:app/components/fundwise_leading_navigation_action.dart';
import 'package:app/components/scaffold.dart';
import 'package:app/router/router.dart';
import 'package:duck_router/duck_router.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class SidebarLeading extends StatelessWidget {
  const SidebarLeading({
    required this.expanded,
    required this.matchedLocation,
    super.key,
  });

  final String? matchedLocation;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    Color? color(String route) {
      return matchedLocation?.startsWith(route) ?? false
          ? context.colorScheme.secondaryContainer
          : null;
    }

    final router = DuckRouter.of(context);

    return BlocProvider(
      create: _createAccountSummaries,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FundwiseLeadingNavigationAction(),
          const Divider(height: 0),
          SidebarRoute(
            label: 'BUDGET',
            icon: Icons.wallet,
            color: color('/budget'),
            onTap: () => router.navigate(to: const BudgetLocation()),
          ),
          SidebarRoute(
            label: 'REPORTS',
            icon: Icons.analytics,
            color: color('/reports'),
            onTap: () => router.navigate(to: const ReportingLocation()),
          ),
          SidebarRoute(
            label: 'ACCOUNTS',
            icon: Icons.account_balance,
            color: color('/accounts'),
            onTap: () => router.navigate(to: const AccountsLocation()),
          ),
          if (expanded) ...[
            const Gutter(),
            const Expanded(child: AccountGroupList()),
          ],
        ],
      ),
    );
  }

  AccountSummariesBloc _createAccountSummaries(BuildContext context) {
    return AccountSummariesBloc()..add(AccountSummariesInitialize());
  }
}

class FundwiseBodyBuilder extends StatelessWidget {
  const FundwiseBodyBuilder({
    super.key,
    this.header,
    this.primary,
    this.secondary,
  });

  final WidgetBuilder? header;
  final WidgetBuilder? primary;
  final WidgetBuilder? secondary;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            if (constraints.maxHeight > 720 && header != null)
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 192),
                child: header!(context),
              ),
            Expanded(
              child: Row(
                children: [
                  if (primary != null) Expanded(child: primary!(context)),
                  if (constraints.maxWidth > 960 && secondary != null)
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 456),
                      child: secondary!(context),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
