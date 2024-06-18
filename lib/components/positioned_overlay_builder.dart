import 'package:flutter/material.dart';

class PositionedOverlayBuilder extends StatefulWidget {
  const PositionedOverlayBuilder({
    required this.anchorBuilder,
    required this.overlayChildBuilder,
    this.dismissible = true,
    this.barrierColor = Colors.transparent,
    this.debugLabel,
    super.key,
  });

  final String? debugLabel;
  final bool dismissible;
  final Color barrierColor;
  final Widget Function(
    BuildContext context,
    OverlayPortalController controller,
  ) anchorBuilder;

  /// Builder for the overlay widget.
  ///
  /// Provides the [OverlayPortalController] controller.
  ///
  /// Provides the [Size] and origin [Offset] of the [anchorBuilder]'s widget.
  /// You can get a corner or side of the widget using:
  /// ```dart
  /// final bottomRight = size.bottomRight(origin);
  /// final center = size.center(origin);
  /// final bottomCenter = size.bottomCenter(origin);
  /// ```
  final Widget Function(
    BuildContext context,
    OverlayPortalController controller,
    Size size,
    Offset origin,
  ) overlayChildBuilder;

  @override
  State<PositionedOverlayBuilder> createState() =>
      _PositionedOverlayBuilderState();
}

class _PositionedOverlayBuilderState extends State<PositionedOverlayBuilder> {
  late final controller =
      OverlayPortalController(debugLabel: widget.debugLabel);

  late final key = GlobalKey(debugLabel: widget.debugLabel);

  Offset getWidgetOrigin(RenderBox renderBox) {
    return renderBox.localToGlobal(Offset.zero);
  }

  RenderBox getRenderBox() =>
      key.currentContext!.findRenderObject()! as RenderBox;

  @override
  Widget build(BuildContext context) {
    return OverlayPortal.targetsRootOverlay(
      key: key,
      controller: controller,
      overlayChildBuilder: (context) {
        final renderBox = getRenderBox();
        final origin = getWidgetOrigin(renderBox);
        return Stack(
          children: [
            ModalBarrier(
              dismissible: widget.dismissible,
              onDismiss: controller.hide,
              color: widget.barrierColor,
            ),
            widget.overlayChildBuilder(
              context,
              controller,
              renderBox.size,
              origin,
            ),
          ],
        );
      },
      child: widget.anchorBuilder(
        context,
        controller,
      ),
    );
  }
}
