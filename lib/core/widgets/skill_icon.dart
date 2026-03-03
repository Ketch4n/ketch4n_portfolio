import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_painter.dart';

class SkillIconWidget extends StatelessWidget {
  final String assetPath;
  // final Color themeColor;
  final String text;

  const SkillIconWidget({
    super.key,
    required this.assetPath,
    // required this.themeColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(
          size: const Size(100, 110),
          painter: HexagonPainter(themeColor: Colors.white),
          child: SizedBox(
            width: 50,
            height: 60,
            child: Center(
              child: Image.asset(
                assetPath,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Text(text, style: TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
