import 'package:flutter/material.dart';

class AppTextStyles {
  // Use a static method that takes context
  static TextStyle heroTitle(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge!;
  }

  static TextStyle heroSubTitle(BuildContext context) {
    // .copyWith allows you to add specific tweaks like opacity
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
    );
  }
}
