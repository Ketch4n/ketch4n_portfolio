import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag_painter.dart';

class TextTagWidget extends StatefulWidget {
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
  State<TextTagWidget> createState() => _TextTagWidgetState();
}

class _TextTagWidgetState extends State<TextTagWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Border border = _isHovered
        ? Border.all(color: Colors.transparent, width: 1)
        : Border.all(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
            width: 1,
          );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: CustomPaint(
        painter: _isHovered ? NeonBorderPainter() : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: widget.boxColor,
            borderRadius: BorderRadius.circular(5),
            border: border,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
              fontSize: widget.textSize != null
                  ? double.tryParse(widget.textSize!)
                  : null,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
