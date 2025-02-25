import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FundwiseDivider extends StatelessWidget {
  const FundwiseDivider({this.thickness, this.margin, this.color, super.key})
    : _type = _FundwiseDivider.auto;

  const FundwiseDivider.vertical({
    this.thickness,
    this.margin,
    this.color,
    super.key,
  }) : _type = _FundwiseDivider.vertical;

  const FundwiseDivider.horizontal({
    this.thickness,
    this.margin,
    this.color,
    super.key,
  }) : _type = _FundwiseDivider.horizontal;

  final _FundwiseDivider _type;
  final double? thickness;
  final EdgeInsetsDirectional? margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return switch (_type) {
      _FundwiseDivider.auto => _buildAuto(context),
      _FundwiseDivider.horizontal => _buildHorizontal(context),
      _FundwiseDivider.vertical => _buildVertical(context),
    };
  }

  Widget _buildAuto(BuildContext context) {
    return switch (findOrientation(context)) {
      null => throw UnimplementedError(),
      Orientation.portrait => _buildHorizontal(context),
      Orientation.landscape => _buildVertical(context),
    };
  }

  Widget _buildVertical(BuildContext context) {
    return SizedBox(
      width: 1,
      child: Center(
        child: Container(
          width: 1,
          margin: margin,
          decoration: BoxDecoration(
            border: Border(left: ShadTheme.of(context).cardTheme.border!.left),
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontal(BuildContext context) {
    return SizedBox(
      height: 1,
      child: Center(
        child: Container(
          height: 1,
          margin: margin,
          decoration: BoxDecoration(
            border: Border(top: ShadTheme.of(context).cardTheme.border!.top),
          ),
        ),
      ),
    );
  }

  Orientation? findOrientation(BuildContext context) {
    Orientation? orientation;

    final ScrollableState? scrollableState = Scrollable.maybeOf(context);
    final AxisDirection? axisDirection = scrollableState?.axisDirection;
    final Axis? scrollableDirection =
        axisDirection == null ? null : axisDirectionToAxis(axisDirection);
    Orientation toOrientation(Axis axis) => switch (axis) {
      Axis.horizontal => Orientation.landscape,
      Axis.vertical => Orientation.portrait,
    };
    context.visitAncestorElements((Element element) {
      final Widget widget = element.widget;

      // Check for Scrollable widget
      if (widget is Scrollable) {
        orientation = toOrientation(widget.axis);
        return false;
      }

      // Check for Flex widget (Row, Column)
      if (widget is Flex) {
        orientation = toOrientation(widget.direction);
        return false;
      }

      return true;
    });

    // Use fallback direction if no orientation is found
    if (orientation == null && scrollableDirection != null) {
      orientation = toOrientation(scrollableDirection);
    }

    return orientation;
  }
}

enum _FundwiseDivider { auto, horizontal, vertical }
