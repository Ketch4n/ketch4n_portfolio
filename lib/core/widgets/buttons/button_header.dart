import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/buttons/button_item_entity.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';
import 'package:url_launcher/link.dart';

class ButtonHeaderWidget extends StatefulWidget {
  const ButtonHeaderWidget({
    super.key,
    required this.actionButtons,
    required this.iconLinks,
    required this.textTags,
    this.alignment = MainAxisAlignment.start,
    this.spacing = 5.0,
    this.buttonBorderRadius = 10.0,
  });

  final List<ActionButtonItemEntity> actionButtons;
  final List<ButtonItemEntity> iconLinks;
  final List<TextTagWidget> textTags;
  final MainAxisAlignment alignment;
  final double spacing;
  final double buttonBorderRadius;

  @override
  State<ButtonHeaderWidget> createState() => _ButtonHeaderWidgetState();
}

class _ButtonHeaderWidgetState extends State<ButtonHeaderWidget> {
  // Tracks which action buttons are currently running an async onPressed.
  final Set<int> _loadingIndexes = <int>{};

  Future<void> _handlePressed(int index, ActionButtonItemEntity btn) async {
    final onPressed = btn.onPressed;
    if (onPressed == null || _loadingIndexes.contains(index)) return;

    setState(() => _loadingIndexes.add(index));
    try {
      await onPressed();
    } finally {
      // Widget may have been disposed while the async work was in flight.
      if (mounted) {
        setState(() => _loadingIndexes.remove(index));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (int i = 0; i < widget.actionButtons.length; i++) {
      final btn = widget.actionButtons[i];
      final bool isLoading = _loadingIndexes.contains(i);
      children.add(
        Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: FilledButton(
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.buttonBorderRadius),
              ),
            ),
            onPressed: isLoading ? null : () => _handlePressed(i, btn),
            child: Wrap(
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if (isLoading)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  const Icon(Icons.remove_red_eye),
                Text(
                  btn.label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      );
      if (i < widget.actionButtons.length - 1 || widget.iconLinks.isNotEmpty) {
        children.add(SizedBox(width: widget.spacing));
      }
    }

    for (final textTagItem in widget.textTags) {
      children.add(
        Padding(padding: const EdgeInsets.only(top: 3.0), child: textTagItem),
      );
    }

    for (final link in widget.iconLinks) {
      children.add(
        Link(
          target: LinkTarget.blank,
          uri: Uri.parse(link.url),
          builder: (context, followLink) => IconButton(
            tooltip: link.tooltip,
            onPressed: followLink,
            icon: link.icon,
          ),
        ),
      );
    }

    return Wrap(
      runSpacing: widget.spacing,
      spacing: widget.spacing,
      children: children,
    );
  }
}
