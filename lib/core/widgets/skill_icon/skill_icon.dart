import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_painter.dart';

class SkillIconWidget extends StatelessWidget {
  final String assetPath;
  final String text;

  const SkillIconWidget({
    super.key,
    required this.assetPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: text,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomPaint(
              size: const Size(80, 90),
              painter: HexagonPainter(
                themeColor: Theme.of(context).colorScheme.primary,
                surfaceColor: Theme.of(context).colorScheme.surface,
              ),
              child: SizedBox(
                width: 60,
                height: 70,
                child: Center(
                  child: Image.asset(
                    assetPath,
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
