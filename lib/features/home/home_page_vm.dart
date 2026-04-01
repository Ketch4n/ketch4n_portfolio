import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  HomeViewModel() {
    _init();
  }

  Future<void> _init() async {
    await simulateLoading();
  }

  Future<void> simulateLoading() async {
    _isLoading = true;
    notifyListeners(); // Tell the UI to show the loader

    await Future.delayed(const Duration(seconds: 3));

    _isLoading = false;
    notifyListeners(); // Tell the UI to hide the loader and show content
  }
}
