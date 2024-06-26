import 'package:flutter/material.dart';

class PositionedOverlayBuilder extends StatefulWidget {
  const PositionedOverlayBuilder({
    required this.anchorBuilder,
    required this.overlayChildBuilder,
    this.overlayContraints = const BoxConstraints(),
    this.dismissible = true,
    this.barrierColor,
    this.debugLabel,
    super.key,
  });

  final String? debugLabel;
  final Color? barrierColor;
  final bool dismissible;
  final BoxConstraints overlayContraints;

  final Widget Function(
    BuildContext context,
    OverlayPortalController controller,
  ) anchorBuilder;

  final Widget Function(
    BuildContext context,
    OverlayPortalController controller,
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

        final sizeOf = MediaQuery.sizeOf(context);
        final isTop = sizeOf.height / 2 > origin.dy;
        final isLeft = sizeOf.width / 2 > origin.dx;

        final position = switch ((isTop, isLeft)) {
          (true, true) => renderBox.size.bottomLeft(origin),
          (true, false) => renderBox.size.bottomRight(origin),
          (false, true) => renderBox.size.topLeft(origin),
          (false, false) => renderBox.size.topRight(origin),
        };

        final left = isLeft ? position.dx : null;
        final right = isLeft ? null : sizeOf.width - position.dx;
        final top = isTop ? position.dy : null;
        final bottom = isTop ? null : sizeOf.height - origin.dy;

        return Stack(
          children: [
            if (widget.dismissible)
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => controller.hide(),
                ),
              ),
            Positioned(
              left: left,
              right: right,
              top: top,
              bottom: bottom,
              child: ConstrainedBox(
                constraints: widget.overlayContraints,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                  elevation: 20,
                  child: widget.overlayChildBuilder(
                    context,
                    controller,
                  ),
                ),
              ),
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
