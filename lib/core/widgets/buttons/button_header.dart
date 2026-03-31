import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/widgets/buttons/button_item_entity.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';
import 'package:url_launcher/link.dart';

class ButtonHeaderWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (int i = 0; i < actionButtons.length; i++) {
      final btn = actionButtons[i];
      children.add(
        FilledButton(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonBorderRadius),
            ),
          ),
          onPressed: btn.onPressed,
          child: Row(
            spacing: 10,
            children: [
              FaIcon(FontAwesomeIcons.download),
              Text(btn.label, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
      if (i < actionButtons.length - 1 || iconLinks.isNotEmpty) {
        children.add(SizedBox(width: spacing));
      }
    }

    for (final textTagItem in textTags) {
      children.add(
        Padding(
          padding: EdgeInsets.only(right: spacing),
          child: textTagItem,
        ),
      );
    }

    for (final link in iconLinks) {
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

    return Row(mainAxisAlignment: alignment, children: children);
  }
}
