enum TypingStatus { typing, deleting, paused, idle }

class TypingEngine {
  final List<String> texts;
  int _index = 0;
  int _charIndex = 0;
  bool _isDeleting = false;
  bool get isDeleting => _isDeleting;

  TypingEngine(this.texts);

  String get currentText => texts[_index].substring(0, _charIndex);
  bool get isComplete => _charIndex == texts[_index].length;
  bool get isEmpty => _charIndex == 0;

  /// Returns the next state of the string
  String tick() {
    if (texts.isEmpty) return '';

    if (_isDeleting) {
      if (_charIndex > 0) _charIndex--;
      if (_charIndex == 0) {
        _isDeleting = false;
        _index = (_index + 1) % texts.length;
      }
    } else {
      if (_charIndex < texts[_index].length) _charIndex++;
    }
    return currentText;
  }

  void setDeleting(bool deleting) => _isDeleting = deleting;
  void reset() {
    _index = 0;
    _charIndex = 0;
    _isDeleting = false;
  }
}
