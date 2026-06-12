import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/core/widgets/flip_card/flip_card_vm.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/widgets/profile_icon.dart';

class FlipCardWidget extends ConsumerWidget {
  const FlipCardWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = ref.watch(flipCardProvider);
    final notifier = ref.read(flipCardProvider.notifier);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => notifier.setHover(true),
      onExit: (_) => notifier.setHover(false),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: isHovered ? pi : 0),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutBack,
        builder: (context, angle, _) {
          final isFront = angle < pi / 2;

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            alignment: Alignment.center,
            child: isFront
                ? ProfileIconWidget(image: AppConstants.profileImg)
                : Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: const ProfileIconWidget(
                      image: "assets/dev/formal_crop.jpg",
                    ),
                  ),
          );
        },
      ),
    );
  }
}
