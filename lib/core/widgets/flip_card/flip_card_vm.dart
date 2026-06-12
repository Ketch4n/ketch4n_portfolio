import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlipCardNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void setHover(bool value) {
    if (state != value) {
      state = value;
    }
  }
}

final flipCardProvider = NotifierProvider.autoDispose<FlipCardNotifier, bool>(
  FlipCardNotifier.new,
);
