import 'package:app/account_summaries/account_summaries.dart';
import 'package:app/accounts/accounts_location.dart';
import 'package:app/budget/budget_location.dart';
import 'package:app/components/components.dart';
import 'package:app/current_location/current_location.dart';
import 'package:app/reports/reports_location.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:mix/mix.dart';

final _baseStyle = Style(
  $box.padding.all(8),
  $box.margin.all(4),
  $box.borderRadius.all(8),
  $icon.size(40),
);

final _selected = _baseStyle.addAll([
  $box.color($material.colorScheme.primary()),
  $text.style.color($material.colorScheme.onPrimary()),
  $icon.color($material.colorScheme.onPrimary()),
  $on.hover($box.color.lighten(10)),
]);

final _notSelected = _baseStyle.addAll([
  $box.color($material.colorScheme.background()),
  $on.hover($box.color.darken(10)),
]);

class SidebarLeading extends StatelessWidget {
  const SidebarLeading({
    required this.expanded,
    super.key,
  });

  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final location = context.watch<CurrentLocationCubit>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SidebarSettingsButton(),
        const Divider(height: 0),
        PressableBox(
          onPress: () => context.navigate(to: const BudgetLocation()),
          style: location is BudgetLocation ? _selected : _notSelected,
          child: const Row(
            children: [
              StyledIcon(Icons.wallet),
              Gutter(),
              StyledText('BUDGET'),
            ],
          ),
        ),
        PressableBox(
          onPress: () => context.navigate(to: const ReportsLocation()),
          style: location is ReportsLocation ? _selected : _notSelected,
          child: const Row(
            children: [
              StyledIcon(Icons.analytics),
              Gutter(),
              StyledText('REPORTS'),
            ],
          ),
        ),
        PressableBox(
          onPress: () => context.navigate(to: const AccountsLocation()),
          style: location is AccountsLocation ? _selected : _notSelected,
          child: const Row(
            children: [
              StyledIcon(Icons.account_balance),
              Gutter(),
              StyledText('ACCOUNTS'),
            ],
          ),
        ),
        if (expanded) ...[
          const Gutter(),
          const Expanded(child: AccountGroupList()),
        ],
      ],
    );
  }
}
