import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/beam/beam_border_painter.dart';

class BeamBorderAnimation extends StatefulWidget {
  final Widget child;
  const BeamBorderAnimation({super.key, required this.child});

  @override
  State<BeamBorderAnimation> createState() => _BeamBorderAnimationState();
}

class _BeamBorderAnimationState extends State<BeamBorderAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BeamBorderPainter(
        animationValue: _controller,
        color: Colors.blueAccent,
      ),
      child: widget.child,
    );
  }
}
