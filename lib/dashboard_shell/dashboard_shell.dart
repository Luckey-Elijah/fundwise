import 'package:app/components/scaffold.dart';
import 'package:app/router/router.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class DashboardShell extends StatelessWidget {
  const DashboardShell({
    required this.child,
    required this.matchedLocation,
    required this.url,
    super.key,
  });

  final String matchedLocation;
  final Widget child;
  final Uri url;

  @override
  Widget build(BuildContext context) {
    return FundwiseResponsiveScaffold(
      sidebarLeading: (context, expanded) {
        return SidebarLeading(
          expanded: expanded,
          matchedLocation: matchedLocation,
        );
      },
      sidebarLeadingCollapseButton: (context, toggle, expanded) {
        return ExpandButton(expanded: expanded, onPressed: toggle);
      },
      body: (context) => child,
    );
  }

  int? selectedIndex(String matchedLocation) {
    const io = ['/budget', '/reports', '/accounts'];
    for (var i = 0; i < io.length; i++) {
      if (matchedLocation.startsWith(io[i])) return i;
    }
    return null;
  }
}

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
            onTap: () => duckRouter.navigate(
              to: const BudgetLocation(),
              clearStack: true,
            ),
          ),
          SidebarRoute(
            label: 'REPORTS',
            icon: Icons.analytics,
            color: color('/reports'),
            onTap: () => duckRouter.navigate(
              to: const ReportingLocation(),
              clearStack: true,
            ),
          ),
          SidebarRoute(
            label: 'ACCOUNTS',
            icon: Icons.account_balance,
            color: color('/accounts'),
            onTap: () => duckRouter.navigate(
              to: const AccountsLocation(),
              clearStack: true,
            ),
          ),
          if (expanded) ...[
            const Gutter(),
            const Expanded(
              child: AccountGroupList(),
            ),
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
