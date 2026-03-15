import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/flip_card/flip_card_vm.dart';
import 'package:provider/provider.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/widgets/profile_icon.dart';

class FlipCardWidget extends StatelessWidget {
  const FlipCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FlipCardVM(),
      child: Consumer<FlipCardVM>(
        builder: (context, controller, _) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => controller.setHover(true),
            onExit: (_) => controller.setHover(false),
            // Using Selector here is high-performance: it only triggers
            // the builder if 'isHovered' changes.
            child: Selector<FlipCardVM, bool>(
              selector: (_, provider) => provider.isHovered,
              builder: (context, isHovered, child) {
                return TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: isHovered ? pi : 0),
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOutBack,
                  builder: (context, angle, _) {
                    final isFront = angle < pi / 2;

                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001) // Perspective
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
                );
              },
            ),
          );
        },
      ),
    );
  }
}
