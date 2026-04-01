import 'package:flutter/material.dart';

class BlinkingCursorAnimation extends StatefulWidget {
  const BlinkingCursorAnimation({super.key});

  @override
  State<BlinkingCursorAnimation> createState() =>
      _BlinkingCursorAnimationState();
}

class _BlinkingCursorAnimationState extends State<BlinkingCursorAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(width: 3, height: 35, color: Colors.white),
    );
  }
}
