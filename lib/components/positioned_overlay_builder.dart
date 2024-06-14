import 'package:flutter/material.dart';

class PositionedOverlayBuilder extends StatefulWidget {
  const PositionedOverlayBuilder({
    required this.anchorBuilder,
    required this.overlayChildBuilder,
    super.key,
    this.debugLabel,
  });

  final String? debugLabel;

  final Widget Function(
    BuildContext context,
    OverlayPortalController controller,
  ) anchorBuilder;

  final Widget Function(
    BuildContext context,
    OverlayPortalController controller,
    Size size,
    Offset offset,
  ) overlayChildBuilder;

  @override
  State<PositionedOverlayBuilder> createState() =>
      _PositionedOverlayBuilderState();
}

class _PositionedOverlayBuilderState extends State<PositionedOverlayBuilder> {
  late final controller =
      OverlayPortalController(debugLabel: widget.debugLabel);

  late final key = GlobalKey(debugLabel: widget.debugLabel);

  ({Size size, Offset offset}) getWidgetSizeOffset(GlobalKey key) {
    final renderBox = key.currentContext!.findRenderObject()! as RenderBox;
    final origin = renderBox.localToGlobal(Offset.zero);
    return (size: renderBox.size, offset: renderBox.size.center(origin));
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal.targetsRootOverlay(
      key: key,
      controller: controller,
      overlayChildBuilder: (context) {
        final (:size, :offset) = getWidgetSizeOffset(key);
        return widget.overlayChildBuilder(context, controller, size, offset);
      },
      child: widget.anchorBuilder(
        context,
        controller,
      ),
    );
  }
}
