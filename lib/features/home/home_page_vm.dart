import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    await Future.delayed(const Duration(seconds: 3));
    return true; // true = loaded
  }
}

final homeProvider = AsyncNotifierProvider<HomeNotifier, bool>(
  HomeNotifier.new,
);
