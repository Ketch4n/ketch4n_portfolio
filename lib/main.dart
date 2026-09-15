import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Give the image cache more headroom so decoded project screenshots stay
  // resident and don't re-decode (which causes visible blank frames) when
  // paging through mockups or revisiting a project.
  PaintingBinding.instance.imageCache
    ..maximumSize =
        200 // number of images
    ..maximumSizeBytes = 200 << 20; // 200 MB

  runApp(const ProviderScope(child: MyApp()));
}
