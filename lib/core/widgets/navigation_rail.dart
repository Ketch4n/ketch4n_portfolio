import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';

class NavigationRailWidget extends StatelessWidget {
  const NavigationRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final bool isDesktop = Responsive.isDesktop(context);

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
          _buildNavItem(context, FontAwesomeIcons.solidAddressCard, "About"),

          _buildNavItem(context, FontAwesomeIcons.layerGroup, "Skills"),

          _buildNavItem(context, FontAwesomeIcons.code, "Projects"),

          _buildNavItem(context, FontAwesomeIcons.briefcase, "Work Exp"),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, FaIconData icon, String message) {
    // This is the core clickable content
    Widget navContent = InkWell(
      onTap: () {},
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
