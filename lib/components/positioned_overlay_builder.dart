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

  ({Size size, Offset origin}) getWidgetSizeOffset(GlobalKey key) {
    final renderBox = key.currentContext!.findRenderObject()! as RenderBox;
    final origin = renderBox.localToGlobal(Offset.zero);

    return (size: renderBox.size, origin: origin);
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal.targetsRootOverlay(
      key: key,
      controller: controller,
      overlayChildBuilder: (context) {
        final (:size, :origin) = getWidgetSizeOffset(key);
        return widget.overlayChildBuilder(context, controller, size, origin);
      },
      child: widget.anchorBuilder(
        context,
        controller,
      ),
    );
  }
}
