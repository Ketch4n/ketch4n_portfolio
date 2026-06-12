import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextTagState {
  final bool isHovered;
  const TextTagState({this.isHovered = false});

  FontWeight get textWeight => isHovered ? FontWeight.bold : FontWeight.normal;
}

class TextTagNotifier extends Notifier<TextTagState> {
  @override
  TextTagState build() => const TextTagState();

  void setHover(bool value) {
    if (state.isHovered == value) return;
    state = TextTagState(isHovered: value);
  }
}

final textTagProvider =
    NotifierProvider.autoDispose<TextTagNotifier, TextTagState>(
      TextTagNotifier.new,
    );
