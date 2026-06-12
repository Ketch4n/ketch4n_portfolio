import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/core/theme/light_dark_mode.dart';
import 'package:ketch4n/core/theme/theme_provider.dart';
import 'package:ketch4n/features/home/home_page.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Ketch4n',
      debugShowCheckedModeBanner: false,
      themeMode: themeState.themeMode,
      theme: LightDarkMode.lightTheme,
      darkTheme: LightDarkMode.darkTheme,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        scrollbars: false,
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      home: const HomePage(),
    );
  }
}
