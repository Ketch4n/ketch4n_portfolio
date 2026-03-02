import 'dart:math' as math;

import 'package:flutter/material.dart';

class HexagonPainter extends CustomPainter {
  final Color themeColor;

  HexagonPainter({required this.themeColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // 1. Create the Hexagon Path
    final path = Path();
    for (int i = 0; i < 6; i++) {
      double angle = (i * 60 - 90) * math.pi / 180;
      double x = center.dx + radius * math.cos(angle);
      double y = center.dy + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    // 2. Draw Glow/Shadow
    // canvas.drawShadow(
    //   path.shift(const Offset(0, 4)),
    //   themeColor.withOpacity(0.5),
    //   4.0,
    //   true,
    // );

    // 3. Draw Inner Fill (The Glass Look)
    final fillPaint = Paint()
      ..color = const Color.fromARGB(255, 23, 36, 66).withValues(alpha: 0.9)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    // 4. Draw Gradient Border
    // final borderPaint = Paint()
    //   ..shader = LinearGradient(
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //     colors: [themeColor, themeColor.withValues(alpha: 0.2)],
    //   ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
    //   ..style = PaintingStyle.stroke
    //   // ..strokeWidth = 2.0
    //   ..strokeJoin =
    //       StrokeJoin.round; // round off the hexagon corners for a smoother look

    // canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
