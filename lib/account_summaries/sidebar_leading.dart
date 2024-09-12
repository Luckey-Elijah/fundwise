import 'package:app/account_summaries/account_summaries.dart';
import 'package:app/components/fundwise_leading_navigation_action.dart';
import 'package:app/components/scaffold.dart';
import 'package:app/router/router.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SidebarSettingsButton(),
        const Divider(height: 0),
        SidebarRoute(
          label: 'BUDGET',
          icon: Icons.wallet,
          color: color('/budget'),
          onTap: () => context.navigate(to: const BudgetLocation()),
        ),
        SidebarRoute(
          label: 'REPORTS',
          icon: Icons.analytics,
          color: color('/reports'),
          onTap: () => context.navigate(to: const ReportingLocation()),
        ),
        SidebarRoute(
          label: 'ACCOUNTS',
          icon: Icons.account_balance,
          color: color('/accounts'),
          onTap: () => context.navigate(to: const AccountsLocation()),
        ),
        if (expanded) ...[
          const Gutter(),
          const Expanded(child: AccountGroupList()),
        ],
      ],
    );
  }
}
