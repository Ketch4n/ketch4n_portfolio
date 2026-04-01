import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

/// A widget that wraps a child with a mirrored electric surge animation.
/// The surge starts at the bottom center, splits, and meets at the top center.
class ElectricSplitBorder extends StatefulWidget {
  final Widget child;
  final Color electricColor;
  final double strokeWidth;
  final Radius borderRadius;
  final Duration duration;

  const ElectricSplitBorder({
    super.key,
    required this.child,
    this.electricColor = Colors.blueAccent,
    this.strokeWidth = 2.0,
    this.borderRadius = const Radius.circular(12),
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<ElectricSplitBorder> createState() => _ElectricSplitBorderState();
}

class _ElectricSplitBorderState extends State<ElectricSplitBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _MirrorElectricPainter(
            animationValue: _controller.value,
            color: widget.electricColor,
            strokeWidth: widget.strokeWidth,
            radius: widget.borderRadius,
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

// --- Internal Painter Logic ---

class _Spark {
  Offset position;
  Offset velocity;
  double alpha = 1.0;
  _Spark({required this.position, required this.velocity});

  void update() {
    position += velocity;
    alpha -= 0.04;
  }
}

class _MirrorElectricPainter extends CustomPainter {
  final double animationValue;
  final Color color;
  final double strokeWidth;
  final Radius radius;
  final List<_Spark> _sparks = [];
  final Random _random = Random();

  _MirrorElectricPainter({
    required this.animationValue,
    required this.color,
    required this.strokeWidth,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final RRect rrect = RRect.fromRectAndRadius(rect, radius);
    final Path fullPath = Path()..addRRect(rrect);
    final PathMetric metric = fullPath.computeMetrics().first;
    final double totalLength = metric.length;

    // Bottom Center is 62.5% of the path
    double startPointShift = totalLength * 0.625;
    double halfLength = totalLength / 2;
    double currentProgress = animationValue * halfLength;

    _drawBranch(
      canvas,
      metric,
      startPointShift,
      currentProgress,
      totalLength,
      true,
    );
    _drawBranch(
      canvas,
      metric,
      startPointShift,
      currentProgress,
      totalLength,
      false,
    );

    _updateAndDrawSparks(canvas);
  }

  void _drawBranch(
    Canvas canvas,
    PathMetric metric,
    double startShift,
    double progress,
    double totalLen,
    bool clockwise,
  ) {
    double beamLength = totalLen * 0.12;
    double headDist = clockwise
        ? (startShift + progress) % totalLen
        : (startShift - progress + totalLen) % totalLen;

    double tailDist = clockwise
        ? (headDist - beamLength + totalLen) % totalLen
        : (headDist + beamLength) % totalLen;

    final Path branchPath = _createJaggedSegment(
      metric,
      tailDist,
      headDist,
      totalLen,
      clockwise,
    );

    final Paint glow = Paint()
      ..color = color.withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth * 3
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    final Paint core = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawPath(branchPath, glow);
    canvas.drawPath(branchPath, core);

    Tangent? headTangent = metric.getTangentForOffset(headDist);
    if (headTangent != null) {
      _spawnSparks(headTangent.position);
    }
  }

  Path _createJaggedSegment(
    PathMetric metric,
    double start,
    double end,
    double totalLen,
    bool clockwise,
  ) {
    final Path res = Path();
    final Random jolt = Random((animationValue * 100).toInt());
    int segments = 15;

    for (int i = 0; i <= segments; i++) {
      double t = i / segments;
      double dist;
      if (clockwise) {
        double diff = (end >= start) ? (end - start) : (totalLen - start + end);
        dist = (start + diff * t) % totalLen;
      } else {
        double diff = (start >= end) ? (start - end) : (start + totalLen - end);
        dist = (start - diff * t + totalLen) % totalLen;
      }

      Tangent? tang = metric.getTangentForOffset(dist);
      if (tang != null) {
        Offset p = tang.position;
        if (i != 0 && i != segments) {
          double noise = (jolt.nextDouble() - 0.5) * 10;
          p += Offset(-tang.vector.dy, tang.vector.dx) * noise;
        }
        i == 0 ? res.moveTo(p.dx, p.dy) : res.lineTo(p.dx, p.dy);
      }
    }
    return res;
  }

  void _spawnSparks(Offset pos) {
    for (int i = 0; i < 2; i++) {
      _sparks.add(
        _Spark(
          position: pos,
          velocity: Offset(
            (_random.nextDouble() - 0.5) * 5,
            (_random.nextDouble() - 0.5) * 5,
          ),
        ),
      );
    }
  }

  void _updateAndDrawSparks(Canvas canvas) {
    for (int i = _sparks.length - 1; i >= 0; i--) {
      _sparks[i].update();
      if (_sparks[i].alpha <= 0) {
        _sparks.removeAt(i);
        continue;
      }
      canvas.drawCircle(
        _sparks[i].position,
        1.0,
        Paint()..color = color.withValues(alpha: _sparks[i].alpha),
      );
      canvas.drawCircle(
        _sparks[i].position,
        0.5,
        Paint()..color = Colors.white.withValues(alpha: _sparks[i].alpha),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _MirrorElectricPainter oldDelegate) => true;
}
