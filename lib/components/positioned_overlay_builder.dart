import 'package:flutter/material.dart';

class PositionedOverlayBuilder extends StatefulWidget {
  const PositionedOverlayBuilder({
    required this.anchorBuilder,
    required this.overlayChildBuilder,
    this.dismissible = true,
    this.barrierColor,
    this.debugLabel,
    super.key,
  });

  final String? debugLabel;
  final Color? barrierColor;
  final bool dismissible;
  final Widget Function(
    BuildContext context,
    OverlayPortalController controller,
  ) anchorBuilder;

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

class PositonedOverlayCard extends StatelessWidget {
  const PositonedOverlayCard({
    required this.position,
    required this.child,
    this.constraints = const BoxConstraints(),
    super.key,
  });

  final BoxConstraints constraints;
  final Offset position;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: ConstrainedBox(
        constraints: constraints,
        child: Card(
          clipBehavior: Clip.hardEdge,
          elevation: 20,
          child: child,
        ),
      ),
    );
  }
}
