import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonItemEntity {
  final FaIcon icon;
  final String tooltip;
  final String url;

  const ButtonItemEntity({
    required this.icon,
    required this.tooltip,
    required this.url,
  });
}

// Data Entity for action buttons in the header
class ActionButtonItemEntity {
  final String label;
  final VoidCallback? onPressed;

  const ActionButtonItemEntity({required this.label, required this.onPressed});
}
