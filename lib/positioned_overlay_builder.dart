import 'package:flutter/material.dart';

class PositionedOverlayBuilder extends StatefulWidget {
  const PositionedOverlayBuilder({
    required this.anchorBuilder,
    required this.child,
    required this.overlayBuilder,
    super.key,
    this.debugLabel,
  });

  final String? debugLabel;

  final Widget Function(
    BuildContext context,
    OverlayPortalController controller,
    Widget child,
  ) anchorBuilder;

  final Widget Function(
    BuildContext context,
    OverlayPortalController controller,
  ) overlayBuilder;
  final Widget child;

  @override
  State<PositionedOverlayBuilder> createState() =>
      _PositionedOverlayBuilderState();
}

class _PositionedOverlayBuilderState extends State<PositionedOverlayBuilder> {
  late final controller =
      OverlayPortalController(debugLabel: widget.debugLabel);

  late final key = GlobalKey(debugLabel: widget.debugLabel);

  Offset getWidgetOffset(GlobalKey key) {
    final renderBox = key.currentContext!.findRenderObject()! as RenderBox;
    final origin = renderBox.localToGlobal(Offset.zero);
    return renderBox.size.center(origin);
  }

  @override
  Widget build(BuildContext context) {
    return widget.anchorBuilder(
      context,
      controller,
      OverlayPortal(
        key: key,
        controller: controller,
        child: widget.child,
        overlayChildBuilder: (context) {
          final offset = getWidgetOffset(key);

          return Positioned(
            top: offset.dy,
            left: offset.dx,
            child: widget.overlayBuilder(context, controller),
          );
        },
      ),
    );
  }
}
