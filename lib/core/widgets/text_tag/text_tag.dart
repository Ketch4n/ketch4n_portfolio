import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag_painter.dart';
import 'package:provider/provider.dart';
import 'text_tag_vm.dart'; // Ensure this matches your file path

class TextTagWidget extends StatelessWidget {
  final String text;
  final String? textSize;
  final Color boxColor;

  const TextTagWidget({
    super.key,
    required this.text,
    this.textSize,
    this.boxColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TextTagVM(),
      child: Consumer<TextTagVM>(
        builder: (context, vm, _) {
          // --- 1. PUT YOUR LOGIC HERE ---
          final theme = Theme.of(context);
          final isHovered = vm.isHovered;

          // Define your adaptive border
          final Border border = isHovered
              ? Border.all(color: Colors.transparent, width: 1)
              : Border.all(
                  // This flips between black and white automatically
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
                  width: 1,
                );

          // Define your neon shadows
          // final List<BoxShadow> shadows = isHovered
          //     ? [BoxShadow(color: Colors.blue.withOpacity(0.4), blurRadius: 10)]
          //     : [];
          // ------------------------------

          return MouseRegion(
            onEnter: (_) => vm.setHover(true),
            onExit: (_) => vm.setHover(false),
            child: CustomPaint(
              painter: isHovered ? NeonBorderPainter() : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(5),
                  border: border, // Using your logic
                  // boxShadow: shadows, // Using your logic
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: vm.textWeight,
                    fontSize: textSize != null
                        ? double.tryParse(textSize!)
                        : null,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
