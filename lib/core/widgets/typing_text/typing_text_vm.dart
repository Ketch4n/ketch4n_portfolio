import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ketch4n/core/utils/typing_engine.dart';

class TypingTextVM extends ChangeNotifier {
  final TypingEngine _engine;
  final Duration typingSpeed;
  final Duration deletingSpeed;
  final Duration pauseDuration;

  Timer? _timer;
  String _displayValue = '';

  // The View only cares about the current string to show
  String get displayValue => _displayValue;

  TypingTextVM({
    required List<String> texts,
    this.typingSpeed = const Duration(milliseconds: 50),
    this.deletingSpeed = const Duration(milliseconds: 30),
    this.pauseDuration = const Duration(seconds: 2),
  }) : _engine = TypingEngine(texts);

  void start() => _scheduleTick();

  void _scheduleTick() {
    _timer?.cancel();

    // State-driven logic belongs here in the ViewModel
    Duration nextDelay = _engine.isDeleting ? deletingSpeed : typingSpeed;

    if (_engine.isComplete && !_engine.isDeleting) {
      nextDelay = pauseDuration;
      _engine.setDeleting(true);
    }

    _timer = Timer(nextDelay, () {
      _displayValue = _engine.tick();
      notifyListeners(); // Alert the View to rebuild
      _scheduleTick();
    });
  }

  void stop() => _timer?.cancel();

  @override
  void dispose() {
    stop();
    super.dispose();
  }
}
