import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';

class NavigationRailWidget extends StatelessWidget {
  const NavigationRailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return GlassmorphismWidget(
      entity: GlassmorphismEntity(
        width: isDesktop ? 390 : double.infinity,
        height: isDesktop ? 45 : double.infinity,
        borderRadius: isDesktop ? 10 : 0,
        child: _buildContent(isDesktop, context),
      ),
    );
  }

  Widget _buildContent(bool isDesktop, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 0 : 30,
        horizontal: isDesktop ? 0 : 20, // Added horizontal padding for drawer
      ),
      child: Center(
        child: Flex(
          direction: isDesktop ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: isDesktop
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.start,
          crossAxisAlignment: isDesktop
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            _buildNavItem(
              context,
              FontAwesomeIcons.solidAddressCard,
              "About",
              isDesktop,
            ),
            if (!isDesktop) const SizedBox(height: 25),
            _buildNavItem(
              context,
              FontAwesomeIcons.layerGroup,
              "Skills",
              isDesktop,
            ),
            if (!isDesktop) const SizedBox(height: 25),
            _buildNavItem(
              context,
              FontAwesomeIcons.code,
              "Projects",
              isDesktop,
            ),
            if (!isDesktop) const SizedBox(height: 25),
            _buildNavItem(
              context,
              FontAwesomeIcons.briefcase,
              "Work Exp",
              isDesktop,
            ),
            // if (!isDesktop) const SizedBox(height: 25),
            // _buildNavItem(
            //   context,
            //   FontAwesomeIcons.solidEnvelope,
            //   "Contacts",
            //   isDesktop,
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String message,
    bool isDesktop,
  ) {
    // This is the core clickable content
    Widget navContent = InkWell(
      onTap: () {
        if (!isDesktop) Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              icon,
              size: isDesktop ? 22 : 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            if (!isDesktop) ...[
              const SizedBox(width: 15),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );

    // Only wrap with Tooltip if on Desktop
    if (isDesktop) {
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

    return navContent;
  }
}
