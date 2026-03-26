import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassmorphismWidget extends StatelessWidget {
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
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final Widget child;

  const GlassmorphismWidget({
    super.key,

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
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Get the base color from the theme
    // In Light Mode, this is likely white/grey. In Dark Mode, it's dark.
    final themeColor = Theme.of(context).colorScheme.onSurface;

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
        begin: begin,
        end: end,
        colors: [
          // Use themeColor instead of hardcoded white
          themeColor.withValues(alpha: 0.1),
          themeColor.withValues(alpha: 0.05),
        ],
      ),
      borderGradient: LinearGradient(
        begin: begin,
        end: end,
        colors: [
          // Border should also follow the theme
          themeColor.withValues(alpha: 0.2),
          themeColor.withValues(alpha: 0.5),
        ],
      ),
      child: child,
    );
  }
}
