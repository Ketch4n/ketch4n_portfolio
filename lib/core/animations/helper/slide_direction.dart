import 'package:flutter/material.dart';

enum SlideDirection { leftToRight, rightToLeft, topToBottom, bottomToTop }

class SlideInTransition extends StatelessWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final double offset;
  final Curve curve;
  final SlideDirection direction;

  const SlideInTransition({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 800),
    this.offset = 50.0,
    this.curve = Curves.easeOutQuart,
    this.direction = SlideDirection.bottomToTop,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(delay),
      builder: (context, snapshot) {
        final isReady = snapshot.connectionState == ConnectionState.done;

        return TweenAnimationBuilder<double>(
          duration: duration,
          curve: curve,
          // If not ready, stay at 0.0; once ready, animate to 1.0
          tween: Tween(begin: 0.0, end: isReady ? 1.0 : 0.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: _getOffset(value),
                child: child,
              ),
            );
          },
          child: child,
        );
      },
    );
  }

  Offset _getOffset(double value) {
    final movement = offset * (1 - value);
    switch (direction) {
      case SlideDirection.leftToRight:
        return Offset(-movement, 0);
      case SlideDirection.rightToLeft:
        return Offset(movement, 0);
      case SlideDirection.topToBottom:
        return Offset(0, -movement);
      case SlideDirection.bottomToTop:
        return Offset(0, movement);
    }
  }
}
