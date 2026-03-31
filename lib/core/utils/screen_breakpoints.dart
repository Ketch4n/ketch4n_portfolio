import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  Responsive(this.context);

  // Breakpoints
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 600 &&
      MediaQuery.sizeOf(context).width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1024;

  // Helper for conditional values (e.g., dynamic padding or font sizes)
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (isDesktop(context)) return desktop;
    if (isTablet(context) && tablet != null) return tablet;
    return mobile;
  }
}
