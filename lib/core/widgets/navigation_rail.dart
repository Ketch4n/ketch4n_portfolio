import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';

class NavigationRailWidget extends StatelessWidget {
  /// Called when a nav item is tapped, with the index of the target section.
  /// 0 = About, 1 = Skills, 2 = Projects, 3 = Work Exp.
  final ValueChanged<int>? onNavTap;

  const NavigationRailWidget({super.key, this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismWidget(
      entity: GlassmorphismEntity(
        width: 390,
        height: 45,
        borderRadius: 10,
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(context, FontAwesomeIcons.solidAddressCard, "About", 0),

          _buildNavItem(context, FontAwesomeIcons.layerGroup, "Skills", 1),

          _buildNavItem(context, FontAwesomeIcons.code, "Projects", 2),

          _buildNavItem(context, FontAwesomeIcons.briefcase, "Work Exp", 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    FaIconData icon,
    String message,
    int index,
  ) {
    // This is the core clickable content
    Widget navContent = InkWell(
      onTap: () => onNavTap?.call(index),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              icon,
              size: 22,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );

    return Tooltip(
      message: message,
      verticalOffset: 25,
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.primaryContainer.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      child: navContent,
    );
  }
}
