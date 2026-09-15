import 'package:flutter/material.dart';

/// A lightweight, dependency-free shimmer skeleton.
///
/// Paints an animated highlight sweeping across a base color, giving the
/// classic "loading placeholder" look while content (such as an image) is
/// still decoding. Kept self-contained so it can wrap any child.
class SkeletonShimmer extends StatefulWidget {
  const SkeletonShimmer({
    super.key,
    this.baseColor = const Color(0xFF1E1E1E),
    this.highlightColor = const Color(0xFF2E2E2E),
    this.duration = const Duration(milliseconds: 1200),
    this.child,
  });

  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  /// Optional child (e.g. rounded corners) laid over the shimmer.
  final Widget? child;

  @override
  State<SkeletonShimmer> createState() => _SkeletonShimmerState();
}

class _SkeletonShimmerState extends State<SkeletonShimmer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // RepaintBoundary keeps the per-frame gradient repaint isolated so it
    // doesn't churn ancestor layers or interfere with pointer/mouse tracking.
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  widget.baseColor,
                  widget.highlightColor,
                  widget.baseColor,
                ],
                stops: _stopsFor(_controller.value),
              ),
            ),
            child: child,
          );
        },
        child: SizedBox.expand(child: widget.child),
      ),
    );
  }

  // Slides the three gradient stops across [-0.3 .. 1.3] so the highlight
  // enters from one edge and exits the other on each cycle.
  List<double> _stopsFor(double t) {
    final center = (t * 1.6) - 0.3;
    double clamp01(double v) => v.clamp(0.0, 1.0);
    return [clamp01(center - 0.3), clamp01(center), clamp01(center + 0.3)];
  }
}
