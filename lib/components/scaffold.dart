import 'dart:math';

import 'package:app/components/fundwise_ink.dart';
import 'package:app/components/fundwise_logo.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

part 'scaffold.mapper.dart';

typedef ExpandableWidgetBuilder = Widget Function(
  BuildContext context,
  bool expanded,
);

class FundwiseResponsiveScaffold extends StatefulWidget {
  const FundwiseResponsiveScaffold({
    super.key,
    this.sidebarLeading,
    this.sidebarLeadingCollapseButton,
    this.sidebarTrailing,
    this.sidebarTrailingCollapseButton,
    this.body,
  });

  final ExpandableWidgetBuilder? sidebarLeading;
  final Widget Function(
    BuildContext context,
    VoidCallback toggle,
    bool expanded,
  )? sidebarLeadingCollapseButton;
  final ExpandableWidgetBuilder? sidebarTrailing;
  final ExpandableWidgetBuilder? sidebarTrailingCollapseButton;
  final WidgetBuilder? body;

  @override
  State<FundwiseResponsiveScaffold> createState() =>
      _FundwiseResponsiveScaffoldState();
}

class _FundwiseResponsiveScaffoldState
    extends State<FundwiseResponsiveScaffold> {
  bool expandedState = true;

  void toggle() {
    setState(() {
      expandedState = !expandedState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final md = constraints.maxWidth < 1020;
          final sm = constraints.maxWidth < 720;
          final leadingExpanded = !md && expandedState;
          final constr = BoxConstraints(maxWidth: leadingExpanded ? 320 : 82);

          return Row(
            children: [
              if (!sm) ...[
                ConstrainedBox(
                  constraints: constr,
                  child: Stack(
                    children: [
                      if (widget.sidebarLeading != null)
                        widget.sidebarLeading!(context, leadingExpanded),
                      if (!md && widget.sidebarLeadingCollapseButton != null)
                        widget.sidebarLeadingCollapseButton!(
                          context,
                          toggle,
                          leadingExpanded,
                        ),
                    ],
                  ),
                ),
                if (!sm) const VerticalDivider(width: 0),
              ],
              if (widget.body != null) Expanded(child: widget.body!(context)),
            ],
          );
        },
      ),
    );
  }
}

class AccountGroupList extends StatelessWidget {
  const AccountGroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final (i, group) in context.select(
          (AccountSummariesBloc bloc) => bloc.state.accountGroups.indexed,
        )) ...[
          AccountGroupSummaryWidget(
            group: group,
            index: i,
          ),
          if (group.expanded)
            for (final account in group.accounts)
              AccountSummaryWidget(
                account: account,
              ),
        ],
      ],
    );
  }
}

class SidebarRoute extends StatelessWidget {
  const SidebarRoute({
    required this.label,
    required this.icon,
    super.key,
    this.color,
    this.onTap,
  });

  final Color? color;
  final VoidCallback? onTap;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
      child: FundwiseInk(
        onPrimary: onTap,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 96) {
                return Center(child: Icon(icon, size: 40));
              }
              return Row(
                children: [
                  Icon(icon, size: 40),
                  const Gutter(),
                  Text(label),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class AccountGroupSummaryWidget extends StatelessWidget {
  const AccountGroupSummaryWidget({
    required this.group,
    required this.index,
    super.key,
  });

  final AccountGroupSummary group;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context
                  .read<AccountSummariesBloc>()
                  .add(AccountSummaryToggleExpand(index));
            },
            icon: Transform.rotate(
              angle: group.expanded ? pi / 2 : 0,
              child: const Icon(Icons.chevron_right),
            ),
          ),
          Text(group.label.toUpperCase()),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                group.balance,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountSummaryWidget extends StatefulWidget {
  const AccountSummaryWidget({
    required this.account,
    super.key,
  });

  final AccountSummary account;

  @override
  State<AccountSummaryWidget> createState() => _AccountSummaryWidgetState();
}

class _AccountSummaryWidgetState extends State<AccountSummaryWidget> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final hasAction = hover || widget.account.actions.isNotEmpty;
    return InkWell(
      onTap: () {},
      onHover: (h) => setState(() => hover = h),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Visibility.maintain(
              visible: hasAction,
              child: IconButton(
                onPressed: hasAction ? () {} : null,
                icon: Icon(hover ? Icons.edit : Icons.radio_button_on),
              ),
            ),
            Expanded(
              child: Text(
                widget.account.label,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const GutterTiny(),
            Align(
              alignment: Alignment.centerRight,
              child: Material(
                borderRadius: BorderRadius.circular(8),
                color: widget.account.negative
                    ? context.errorContainer
                    : const Color.fromARGB(0, 107, 92, 92),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    widget.account.balance,
                    style: widget.account.negative ? context.p.onError : null,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FundwiseLeadingNavigationAction extends StatelessWidget {
  const FundwiseLeadingNavigationAction({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 96) {
              return const Center(child: FundwiseLogo());
            }
            return Row(
              children: [
                const FundwiseLogo(),
                const GutterSmall(),
                Flexible(
                  child: Text(
                    'account+user@fundwise.dev',
                    style: context.p.lg.thin,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ExpandButton extends StatelessWidget {
  const ExpandButton({
    required this.expanded,
    required this.onPressed,
    super.key,
  });

  final bool expanded;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: expanded ? Alignment.bottomRight : Alignment.bottomCenter,
      child: IconButton(
        tooltip: expanded ? 'Collapse' : 'Expand',
        onPressed: onPressed,
        icon: Icon(
          expanded ? Icons.chevron_left : Icons.chevron_right,
          size: 40,
        ),
      ),
    );
  }
}

abstract class AccountSummariesEvent {}

class AccountSummariesInitialize extends AccountSummariesEvent {}

class AccountSummaryToggleExpand extends AccountSummariesEvent {
  AccountSummaryToggleExpand(this.index);
  final int index;
}

class AccountSummariesBloc
    extends Bloc<AccountSummariesEvent, AccountSummariesState> {
  AccountSummariesBloc() : super(AccountSummariesState(accountGroups: [])) {
    on<AccountSummaryToggleExpand>((event, emit) {
      emit(
        state.copyWith(
          accountGroups: [
            for (var i = 0; i < state.accountGroups.length; i++) ...[
              if (i == event.index)
                state.accountGroups[i].copyWith(
                  expanded: !state.accountGroups[i].expanded,
                ),
              if (i != event.index) state.accountGroups[i],
            ],
          ],
        ),
      );
    });
    on<AccountSummariesInitialize>((event, emit) {
      emit(
        state.copyWith(
          accountGroups: [
            AccountGroupSummary(
              accounts: [
                AccountSummary(
                  label: 'Credit Card',
                  balance: r'-$733.90',
                  negative: true,
                  actions: {0},
                ),
                AccountSummary(
                  label: 'Checking',
                  balance: r'$2,133.01',
                  actions: {1},
                ),
                AccountSummary(
                  label: 'Checking',
                  balance: r'$6,281.19',
                  actions: {},
                ),
              ],
              label: 'budget',
              balance: r'$12.721.98',
              expanded: true,
            ),
            AccountGroupSummary(
              accounts: [
                AccountSummary(
                  label: 'Mortgage',
                  balance: r'-$292,890.32',
                  negative: true,
                  actions: {},
                ),
              ],
              label: 'loan',
              balance: r'-$292,890.80',
              expanded: true,
              negative: true,
            ),
            AccountGroupSummary(
              accounts: [
                AccountSummary(
                  label: '401(k) Guideline',
                  balance: r'$87,908.76',
                  actions: {},
                ),
                AccountSummary(
                  label: '401k Fidelity',
                  balance: r'$9,725.09',
                  actions: {},
                ),
              ],
              label: 'tracking',
              balance: r'$400,098.32',
              expanded: true,
            ),
          ],
        ),
      );
    });
  }
}

@MappableClass()
class AccountSummariesState with AccountSummariesStateMappable {
  AccountSummariesState({required this.accountGroups});

  final List<AccountGroupSummary> accountGroups;
}

@MappableClass()
class AccountSummary with AccountSummaryMappable {
  AccountSummary({
    required this.label,
    required this.balance,
    this.negative = false,
    this.actions = const <int>{},
  });

  final String label;
  final String balance;
  final bool negative;
  final Set<int> actions;
}

@MappableClass()
class AccountGroupSummary with AccountGroupSummaryMappable {
  AccountGroupSummary({
    required this.label,
    required this.balance,
    required this.accounts,
    this.expanded = false,
    this.negative = false,
  });

  final String label;
  final String balance;
  final bool expanded;
  final bool negative;

  final List<AccountSummary> accounts;
}
