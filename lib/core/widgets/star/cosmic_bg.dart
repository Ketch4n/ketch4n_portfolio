import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/star/star_field_painter.dart';
import 'star_model.dart';

class CosmicBackground extends StatefulWidget {
  final Widget child;
  const CosmicBackground({super.key, required this.child});

  @override
  State<CosmicBackground> createState() => _CosmicBackgroundState();
}

class _CosmicBackgroundState extends State<CosmicBackground>
    with SingleTickerProviderStateMixin {
  late List<Star> stars;
  late AnimationController _controller;
  final int starCount = 150; // Slightly fewer for better performance on web

  @override
  void initState() {
    super.initState();
    stars = List.generate(starCount, (index) => Star());
    _controller =
        AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 16),
          )
          ..addListener(() {
            for (var star in stars) {
              star.update(12.0); // Smooth drift speed
            }
            setState(() {});
          })
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Inside CosmicBackground build method:
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final Color backgroundColor = isDark
        ? const Color(0xFF0D0B21) // Your Dark Nebula Color
        : const Color(0xFFF8F9FF); // Your New Light Nebula Color

    final Color starColor = isDark
        ? Colors.white.withValues(alpha: 0.4)
        : Colors.blueGrey.withValues(alpha: 0.2);

    return Stack(
      children: [
        // The Live Background Layer
        Positioned.fill(
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 500,
            ), // Smooth transition when toggling mode
            color: backgroundColor,
            child: CustomPaint(painter: StarfieldPainter(stars, starColor)),
          ),
        ),
        // Your Page Content Layer
        widget.child,
      ],
    );
  }
}
