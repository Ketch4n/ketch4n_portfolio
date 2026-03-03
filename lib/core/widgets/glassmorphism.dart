import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassmorphismWidget extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final double blur;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;
  final Color firstColor;
  final Color secondColor;

  const GlassmorphismWidget({
    super.key,
    required this.child,
    required this.width,
    required this.height,
    this.borderRadius = 20,
    this.blur = 20,
    this.leftMargin = 20,
    this.rightMargin = 20,
    this.topMargin = 20,
    this.bottomMargin = 20,
    this.firstColor = Colors.white,
    this.secondColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: width,
      height: height,
      margin: EdgeInsets.only(
        left: leftMargin,
        right: rightMargin,
        top: topMargin,
        bottom: bottomMargin,
      ),
      borderRadius: borderRadius,
      blur: blur,
      alignment: Alignment.bottomCenter,
      border: 1,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          firstColor.withValues(alpha: 0.1),
          secondColor.withValues(alpha: 0.05),
        ],
        // stops: [0.1, 1],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          firstColor.withValues(alpha: 0.1),
          secondColor.withValues(alpha: 0.5),
        ],
      ),
      child: child,
    );
  }
}
