import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';

class NavigationRailWidget extends StatelessWidget {
  const NavigationRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismWidget(
      width: 390,
      height: 45,
      borderRadius: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(context, FontAwesomeIcons.solidAddressCard, "About"),
          _buildNavItem(context, FontAwesomeIcons.layerGroup, "Skills"),
          _buildNavItem(context, FontAwesomeIcons.code, "Projects"),
          _buildNavItem(context, FontAwesomeIcons.briefcase, "Work Experience"),
          _buildNavItem(context, FontAwesomeIcons.solidEnvelope, "Contacts"),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String message) {
    return Center(
      child: Tooltip(
        message: message,
        // Optional: Customizing the tooltip style to match your theme
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
        verticalOffset: 25, // Distance from the icon
        child: InkWell(
          onTap: () {
            // Handle navigation here
          },
          borderRadius: BorderRadius.circular(8),
          child: FaIcon(
            icon,
            size: 25, // Adjusted for a 45px height bar
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
