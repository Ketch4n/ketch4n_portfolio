import 'package:flutter/material.dart';

class BeamAnimation extends StatefulWidget {
  final String title;

  const BeamAnimation({super.key, required this.title});

  @override
  State<BeamAnimation> createState() => _BeamAnimationState();
}

class _BeamAnimationState extends State<BeamAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget beamLine(bool left) {
    return Expanded(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return ShaderMask(
            shaderCallback: (rect) {
              // LEFT BEAM: Starts at 1.0 (near text) and moves to 0.0 (edge)
              // RIGHT BEAM: Starts at 0.0 (near text) and moves to 1.0 (edge)
              double position = left
                  ? (1.0 - controller.value)
                  : controller.value;

              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.transparent,
                  Colors.blueAccent.withValues(alpha: .8),
                  Colors.white,
                  Colors.blueAccent.withValues(alpha: .8),
                  Colors.transparent,
                ],
                stops: [
                  0,
                  (position - 0.2).clamp(0.0, 1.0),
                  position,
                  (position + 0.2).clamp(0.0, 1.0),
                  1,
                ],
              ).createShader(rect);
            },
            blendMode: BlendMode.srcATop,
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withValues(alpha: .8),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        beamLine(true),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),

        beamLine(false),
      ],
    );
  }
}
