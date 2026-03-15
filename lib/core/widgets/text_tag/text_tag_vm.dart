import 'package:flutter/material.dart';

class TextTagVM extends ChangeNotifier {
  bool _isHovered = false;
  bool get isHovered => _isHovered;

  // Define neon colors
  static const Color neonBlue = Colors.blueGrey;
  static const Color neonPink = Colors.blue;

  void setHover(bool value) {
    if (_isHovered == value) return;
    _isHovered = value;
    notifyListeners();
  }

  // ViewModel decides the border style
  Border get border => _isHovered
      ? Border.all(color: Colors.transparent, width: 1)
      : Border.all(color: Colors.white, width: 1);

  // ViewModel decides the glow
  List<BoxShadow> get shadows => _isHovered
      ? [
          BoxShadow(
            color: neonBlue.withValues(alpha: 0.4),
            blurRadius: 10,
            // spreadRadius: 1,
          ),
          BoxShadow(
            color: neonPink.withValues(alpha: 0.4),
            blurRadius: 10,
            // spreadRadius: 1,
          ),
        ]
      : [];

  FontWeight get textWeight => _isHovered ? FontWeight.bold : FontWeight.normal;
}
