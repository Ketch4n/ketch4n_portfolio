import 'package:flutter/material.dart';

class TextTagVM extends ChangeNotifier {
  bool _isHovered = false;
  bool get isHovered => _isHovered;

  void setHover(bool value) {
    if (_isHovered == value) return;
    _isHovered = value;
    notifyListeners();
  }

  // Keep the weight here if you want, as it's a data-driven style
  FontWeight get textWeight => _isHovered ? FontWeight.bold : FontWeight.normal;
}
