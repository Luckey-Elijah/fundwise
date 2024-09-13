import 'package:app/account_summaries/account_summaries.dart';
import 'package:flailwind/flailwind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:mix/mix.dart';

class AccountGroupList extends StatelessWidget {
  const AccountGroupList({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = context.select(
      (AccountSummariesBloc bloc) => bloc.state.accountGroups,
    );
    return ListView(
      children: [
        for (var i = 0; i < groups.length; i++) ...[
          AccountGroupSummaryWidget(
            group: groups[i],
            index: i,
          ),
          if (groups[i].expanded)
            for (final account in groups[i].accounts)
              AccountSummaryWidget(
                account: account,
              ),
        ],
      ],
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
    return PressableBox(
      style: Style(
        $box.padding.all(8),
        $on.hover($box.color.darken(10)),
      ),
      onPress: () {
        context
            .read<AccountSummariesBloc>()
            .add(AccountSummaryToggleExpand(index));
      },
      child: Row(
        children: [
          PressableBox(
            child: StyledIcon(
              Icons.chevron_right,
              style: Style(
                $icon.wrap.padding.all(8),
                $with.rotate(group.expanded ? 1 : 0),
              ),
            ),
          ),
          Text(group.label.toUpperCase()),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(group.balance),
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
    final style = widget.account.negative ? context.p.onError : null;

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
                    style: style,
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
