import 'dart:math' as math;
import 'package:flutter/material.dart';

class HexagonPainter extends CustomPainter {
  final Color themeColor; // For the neon border
  final Color surfaceColor; // For the glass fill

  HexagonPainter({required this.themeColor, required this.surfaceColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final path = Path();

    // Create the 6 points of the hexagon
    for (int i = 0; i < 6; i++) {
      // -90 degrees starts the point at the top center
      double angle = (i * 60 - 90) * math.pi / 180;
      double x = center.dx + radius * math.cos(angle);
      double y = center.dy + radius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y); // Move to the first point without drawing
      } else {
        path.lineTo(x, y); // Draw lines to the subsequent points
      }
    }
    path.close(); // Connect the last point back to the first

    // 2. Adaptive Inner Fill (Glass effect)
    final fillPaint = Paint()
      ..color = surfaceColor.withValues(alpha: 0.8)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    // 3. Neon/Gradient Border
    final borderPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [themeColor, themeColor.withValues(alpha: 0.3)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      // ..strokeWidth = 2.5
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant HexagonPainter oldDelegate) {
    return oldDelegate.themeColor != themeColor ||
        oldDelegate.surfaceColor != surfaceColor;
  }
}
