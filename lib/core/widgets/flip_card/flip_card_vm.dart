import 'package:flutter/material.dart';

class FlipCardVM extends ChangeNotifier {
  bool _isHovered = false;
  bool get isHovered => _isHovered;

  void setHover(bool value) {
    if (_isHovered != value) {
      _isHovered = value;
      notifyListeners();
    }
  }
}
