import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag_painter.dart';
import 'text_tag_vm.dart';

class TextTagWidget extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(textTagProvider);
    final notifier = ref.read(textTagProvider.notifier);

    final theme = Theme.of(context);
    final isHovered = vm.isHovered;

    final Border border = isHovered
        ? Border.all(color: Colors.transparent, width: 1)
        : Border.all(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.2),
            width: 1,
          );

    return MouseRegion(
      onEnter: (_) => notifier.setHover(true),
      onExit: (_) => notifier.setHover(false),
      child: CustomPaint(
        painter: isHovered ? NeonBorderPainter() : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(5),
            border: border,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: vm.textWeight,
              fontSize: textSize != null ? double.tryParse(textSize!) : null,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
