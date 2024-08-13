import 'dart:math';

import 'package:flutter/material.dart';

class FundwiseLogo extends StatelessWidget {
  const FundwiseLogo({super.key, this.size = 32});

  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: const FundwiseLogoPainter(),
      size: Size.square(size),
    );
  }
}

class FundwiseLogoPainter extends CustomPainter {
  const FundwiseLogoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final size$ = Size.square(size.shortestSide);

    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = min(size$.width / 12, 24)
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final w = size$.width / 12;
    final h = size$.height / 12;

    double w$(num v) => v * w;
    double h$(num v) => v * h;

    final w$1 = w$(1);
    final w$2 = w$(2);
    final w$3 = w$(3);
    final w$4 = w$(4);
    final w$6 = w$(6);
    final w$8 = w$(8);
    final w$12 = w$(12);

    final h$1 = h$(1);
    final h$2 = h$(2);
    final h$4 = h$(4);
    final h$6 = h$(6);
    final h$8 = h$(8);
    final h$12 = h$(12);

    final outlinePath = Path()
      ..lineTo(w$8, 0)
      ..lineTo(w$8, h$4)
      ..lineTo(w$12, h$4)
      ..lineTo(w$12, h$12)
      ..lineTo(w$4, h$12)
      ..lineTo(w$4, h$8)
      ..lineTo(0, h$8)
      ..close();

    canvas.drawPath(outlinePath, paint);

    final fPath = Path()
      ..lineTo(0, h$4)
      ..moveTo(0, 0)
      ..lineTo(w$3, 0)
      ..moveTo(0, h$2)
      ..lineTo(w$2, h$2);

    final wPath = Path()
      ..lineTo(w$1, h$4)
      ..lineTo(w$2, h$1)
      ..lineTo(w$3, h$4)
      ..lineTo(w$4, 0);

    canvas
      ..drawPath(fPath.shift(Offset(w$(2.5), h$2)), paint)
      ..drawPath(wPath.shift(Offset(w$6, h$6)), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
