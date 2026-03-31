import 'package:flutter/material.dart';
import 'star_model.dart';

class StarfieldPainter extends CustomPainter {
  final List<Star> stars;
  final Color starColor;

  StarfieldPainter(this.stars, this.starColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = starColor
      ..strokeCap = StrokeCap.round;

    // Move origin to center
    canvas.translate(size.width / 2, size.height / 2);

    for (var star in stars) {
      // 3D to 2D Projection
      double sx = (star.x / star.z) * size.width;
      double sy = (star.y / star.z) * size.height;

      // Size based on proximity
      double radius = (1 - star.z / 2000) * 3.5 + 0.5;

      // Previous position for the tail/warp effect
      double px = (star.x / star.prevZ) * size.width;
      double py = (star.y / star.prevZ) * size.height;

      paint.strokeWidth = radius;

      // We apply the opacity here to ensure distant stars fade out smoothly
      final double opacity = (1 - star.z / 2000).clamp(0.1, 1.0);
      paint.color = starColor.withValues(alpha: opacity * starColor.a);

      canvas.drawLine(Offset(px, py), Offset(sx, sy), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
