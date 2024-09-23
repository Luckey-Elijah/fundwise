import 'package:app/account_summaries/account_summaries.dart';
import 'package:app/components/components.dart';
import 'package:app/components/expanded_state.dart';
import 'package:app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:mix/mix.dart';

final _baseStyle = Style(
  $box.padding.all(8),
  $box.margin.all(4),
  $box.borderRadius.all(8),
  $icon.size(40),
  $box.color($material.colorScheme.background()),
  $on.hover($box.color.darken(10)),
);

Style _selectedStyle(BuildContext context) => _baseStyle.addAll([
      $icon.color($material.colorScheme.onPrimary.resolve(context)),
      $text.style.color($material.colorScheme.onPrimary.resolve(context)),
      $box.gradient.linear.colors([
        $material.colorScheme.primary(),
        $material.colorScheme.primary.resolve(context).lighten(40),
      ]),
      $on.hover(
        $box.gradient.linear.colors([
          $material.colorScheme.primary.resolve(context).lighten(),
          $material.colorScheme.primary.resolve(context).lighten(40),
        ]),
      ),
    ]);

class SidebarLeading extends StatefulWidget {
  const SidebarLeading({
    required this.shell,
    required this.expanded,
    super.key,
  });

  final bool expanded;
  final DuckShell shell;

  @override
  State<SidebarLeading> createState() => _SidebarLeadingState();
}

class _SidebarLeadingState extends State<SidebarLeading> {
  int index = 0;

  void switchChild(int index) {
    widget.shell.switchChild(index);
    setState(() => this.index = index);
  }

  @override
  Widget build(BuildContext context) {
    Style style(int i) {
      if (index == i) return _selectedStyle(context);
      return _baseStyle;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SidebarSettingsButton(
          navigateToSettings: () => switchChild(3),
        ),
        const Divider(height: 0),
        SidebarRouteButton(
          style: style(0),
          onPress: () => switchChild(0),
          iconData: Icons.wallet,
          label: 'Budget',
        ),
        SidebarRouteButton(
          style: style(1),
          onPress: () => switchChild(1),
          iconData: Icons.analytics,
          label: 'Reports',
        ),
        SidebarRouteButton(
          style: style(2),
          onPress: () => switchChild(2),
          iconData: Icons.account_balance,
          label: 'Accounts',
        ),
        if (widget.expanded) ...[
          const Gutter(),
          const Expanded(child: AccountGroupList()),
        ],
      ],
    );
  }
}

class FundwiseResponsiveScaffold extends StatefulWidget {
  const FundwiseResponsiveScaffold({
    super.key,
    this.sidebarLeading,
    this.sidebarTrailingCollapseButton,
    this.body,
  });

  final Widget Function(
    BuildContext context,
    bool expanded,
  )? sidebarLeading;
  final Widget Function(
    BuildContext context,
    bool expanded,
  )? sidebarTrailingCollapseButton;
  final WidgetBuilder? body;

  @override
  State<FundwiseResponsiveScaffold> createState() =>
      _FundwiseResponsiveScaffoldState();
}

class _FundwiseResponsiveScaffoldState extends State<FundwiseResponsiveScaffold>
    with ExpandedState {
  @override
  void initState() {
    super.initState();
    expanded = true;
  }

  void toggle() => expanded = !expanded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final md = constraints.maxWidth < 1020;
          final sm = constraints.maxWidth < 720;
          final leadingExpanded = !md && expanded;
          final constr = BoxConstraints(maxWidth: leadingExpanded ? 320 : 82);

          return Row(
            children: [
              if (!sm) ...[
                ConstrainedBox(
                  constraints: constr,
                  child: Column(
                    children: [
                      if (widget.sidebarLeading != null)
                        Expanded(
                          child: widget.sidebarLeading!(
                            context,
                            leadingExpanded,
                          ),
                        ),
                      if (!md)
                        Row(
                          children: [
                            if (leadingExpanded) const FundwiseVersionDocLink(),
                            Expanded(
                              child: SidebarExpandButton(
                                expanded: leadingExpanded,
                                onPressed: toggle,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                if (!sm) ...[
                  const VerticalDivider(),
                  const SizedBox(width: 1),
                ],
              ],
              if (widget.body != null) Expanded(child: widget.body!(context)),
            ],
          );
        },
      ),
    );
  }
}

class SidebarRouteButton extends StatelessWidget {
  const SidebarRouteButton({
    required this.style,
    required this.onPress,
    required this.iconData,
    required this.label,
    super.key,
  });

  final Style style;
  final VoidCallback onPress;
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: PressableBox(
        onPress: onPress,
        style: style,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 96) {
              return Center(child: StyledIcon(iconData));
            }
            return Row(
              children: [
                StyledIcon(iconData),
                Gutter(),
                StyledText(label, style: style),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SidebarExpandButton extends StatelessWidget {
  const SidebarExpandButton({
    required this.expanded,
    required this.onPressed,
    super.key,
  });

  final bool expanded;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: Durations.medium1,
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
