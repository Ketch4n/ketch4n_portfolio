import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ketch4n/core/theme/light_dark_mode.dart';
import 'package:ketch4n/core/theme/theme_provider.dart';
import 'package:ketch4n/features/home/home_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Ketch4n',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: LightDarkMode.lightTheme,
      darkTheme: LightDarkMode.darkTheme,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
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
