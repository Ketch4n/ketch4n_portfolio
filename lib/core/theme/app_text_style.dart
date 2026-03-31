import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle heroTitle(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge!;
  }

  static TextStyle heroSubTitle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
    );
  }
}
