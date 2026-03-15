import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag_painter.dart';
import 'package:provider/provider.dart';
import 'text_tag_vm.dart'; // Ensure this matches your file path

class TextTagWidget extends StatelessWidget {
  final String text;
  final Color boxColor;

  const TextTagWidget({
    super.key,
    required this.text,
    this.boxColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TextTagVM(),
      child: Consumer<TextTagVM>(
        builder: (context, vm, _) {
          return MouseRegion(
            onEnter: (_) => vm.setHover(true),
            onExit: (_) => vm.setHover(false),
            child: CustomPaint(
              // The ViewModel decides IF the painter should run
              painter: vm.isHovered ? NeonBorderPainter() : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(5),
                  border: vm.border,
                  boxShadow: vm.shadows,
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: vm.textWeight,
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
