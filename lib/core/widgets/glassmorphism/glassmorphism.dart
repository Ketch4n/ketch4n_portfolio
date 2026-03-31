import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';

class GlassmorphismWidget extends StatelessWidget {
  final GlassmorphismEntity entity;
  const GlassmorphismWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).colorScheme.onSurface;

    /// 🔥 EXTREMELY transparent fill
    final linearGradient = LinearGradient(
      begin: entity.begin,
      end: entity.end,
      colors: [
        themeColor.withValues(alpha: 0.015),
        themeColor.withValues(alpha: 0.003),
      ],
    );

    /// 🔥 Barely visible border
    final borderGradient = LinearGradient(
      begin: entity.begin,
      end: entity.end,
      colors: [
        themeColor.withValues(alpha: 0.08),
        themeColor.withValues(alpha: 0.12),
      ],
    );

    return Container(
      width: entity.width,
      height: entity.height == 0 ? null : entity.height,
      margin: EdgeInsets.only(
        left: entity.leftMargin,
        right: entity.rightMargin,
        top: entity.topMargin,
        bottom: entity.bottomMargin,
      ),
      child: Stack(
        children: [
          /// 🔹 Layer 1: VERY LIGHT blur
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(entity.borderRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 1.5, // 👈 almost no blur
                  sigmaY: 1.5,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(entity.borderRadius),
                    gradient: linearGradient,
                  ),
                ),
              ),
            ),
          ),

          /// 🔹 Optional ultra-subtle highlight
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(entity.borderRadius),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(entity.borderRadius),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withValues(alpha: 0.03),
                      Colors.white.withValues(alpha: 0.005),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /// 🔹 Thin border
          Positioned.fill(
            child: CustomPaint(
              painter: _GradientBorderPainter(
                radius: entity.borderRadius,
                strokeWidth: 0.8, // 👈 thinner border
                gradient: borderGradient,
              ),
            ),
          ),

          /// 🔹 Content
          ClipRRect(
            borderRadius: BorderRadius.circular(entity.borderRadius),
            child: entity.child,
          ),
        ],
      ),
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientBorderPainter({
    required this.radius,
    required this.strokeWidth,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final outerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    );

    final innerRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        strokeWidth,
        strokeWidth,
        size.width - strokeWidth * 2,
        size.height - strokeWidth * 2,
      ),
      Radius.circular(radius - strokeWidth),
    );

    final paint = Paint()
      ..shader = gradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    final outerPath = Path()..addRRect(outerRect);
    final innerPath = Path()..addRRect(innerRect);

    canvas.drawPath(
      Path.combine(PathOperation.difference, outerPath, innerPath),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _GradientBorderPainter old) =>
      old.radius != radius ||
      old.strokeWidth != strokeWidth ||
      old.gradient != gradient;
}
