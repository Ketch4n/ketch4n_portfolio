import 'package:flutter/material.dart';

class ProjectMockup3D extends StatefulWidget {
  final double height;

  const ProjectMockup3D({super.key, required this.height});

  @override
  State<ProjectMockup3D> createState() => _ProjectMockup3DState();
}

class _ProjectMockup3DState extends State<ProjectMockup3D> {
  double rotationX = 0;
  double rotationY = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          rotationY += details.delta.dx * 0.01;
          rotationX -= details.delta.dy * 0.01;

          rotationX = rotationX.clamp(-0.6, 0.6);
          rotationY = rotationY.clamp(-1.2, 1.2);
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Shadow
          Positioned(
            bottom: 20,
            child: Container(
              width: 200,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),

          // 3D Transform
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0015)
              ..rotateX(rotationX)
              ..rotateY(rotationY),
            child: Image.asset(
              'assets/projects/mockup.png',
              height: widget.height,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
