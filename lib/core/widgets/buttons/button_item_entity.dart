import 'dart:async';

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

  /// Callback invoked when the button is pressed.
  ///
  /// May return a [Future]. When it does, [ButtonHeaderWidget] shows a loading
  /// indicator inside the button until the future completes.
  final FutureOr<void> Function()? onPressed;

  const ActionButtonItemEntity({required this.label, required this.onPressed});
}
