import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';

class GlassmorphismWidget extends StatelessWidget {
  final GlassmorphismEntity entity;
  const GlassmorphismWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    // Get the base color from the theme
    // In Light Mode, this is likely white/grey. In Dark Mode, it's dark.
    final themeColor = Theme.of(context).colorScheme.onSurface;

    return GlassmorphicContainer(
      width: entity.width,
      height: entity.height,
      margin: EdgeInsets.only(
        left: entity.leftMargin,
        right: entity.rightMargin,
        top: entity.topMargin,
        bottom: entity.bottomMargin,
      ),
      borderRadius: entity.borderRadius,
      blur: entity.blur,
      alignment: Alignment.bottomCenter,
      border: 1,
      linearGradient: LinearGradient(
        begin: entity.begin,
        end: entity.end,
        colors: [
          // Use themeColor instead of hardcoded white
          themeColor.withValues(alpha: 0.1),
          themeColor.withValues(alpha: 0.05),
        ],
      ),
      borderGradient: LinearGradient(
        begin: entity.begin,
        end: entity.end,
        colors: [
          // Border should also follow the theme
          themeColor.withValues(alpha: 0.2),
          themeColor.withValues(alpha: 0.5),
        ],
      ),
      child: entity.child,
    );
  }
}
