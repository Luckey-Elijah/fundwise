import 'package:app/components/expanded_state.dart';
import 'package:app/components/fundwise_ink.dart';
import 'package:app/components/fundwise_version_doc_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

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
