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
        width: 70, // Fixed width for each "tile" in the Wrap
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomPaint(
              size: const Size(80, 90), // Adjusted to look better in a grid
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
            // const SizedBox(height: 4),
            // Text(
            //   text,
            //   textAlign: TextAlign.center,
            //   style: const TextStyle(
            //     fontSize: 12,
            //     //  letterSpacing: -0.5,
            //   ),
            //   maxLines: 1,
            //   overflow: TextOverflow.ellipsis,
            // ),
          ],
        ),
      ),
    );
  }
}
