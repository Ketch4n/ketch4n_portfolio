import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/experience_card_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/constants/size_constants.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart';
import 'package:ketch4n/core/widgets/experience_card/experience_card.dart';

class WorkExperiencePage extends StatefulWidget {
  const WorkExperiencePage({super.key});

  @override
  State<WorkExperiencePage> createState() => _WorkExperiencePageState();
}

class _WorkExperiencePageState extends State<WorkExperiencePage> {
  @override
  Widget build(BuildContext context) {
    final experienceData = ExperienceCardConstants.cards;
    final bool isDesktop = Responsive.isDesktop(context);

    return Container(
      constraints: SizeConstants.pageMaxWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const BeamAnimation(title: PortfolioConfig.workExperience),
          const SizedBox(height: 60),

          // Using asMap to handle the alternating logic via index
          ...experienceData.asMap().entries.map((entry) {
            int index = entry.key;
            var entity = entry.value;
            bool isEven = index % 2 == 0;

            return Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Flex(
                // Vertical for Mobile, Horizontal for Desktop
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: isDesktop
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  // --- LEFT SIDE (Desktop) or TOP SIDE (Mobile) ---
                  Flexible(
                    flex: isDesktop ? 1 : 0,
                    child: isDesktop
                        ? (isEven
                              ? _buildCard(entity)
                              : _buildDetailsSide(entity, isEven))
                        : _buildCard(entity), // Mobile always shows card first
                  ),

                  // --- CENTER TIMELINE INDICATOR (Desktop Only) ---
                  if (isDesktop)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.5),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),

                  // --- MOBILE SPACER ---
                  if (!isDesktop) const SizedBox(height: 20),

                  // --- RIGHT SIDE (Desktop) or BOTTOM SIDE (Mobile) ---
                  Flexible(
                    flex: isDesktop ? 1 : 0,
                    child: isDesktop
                        ? (!isEven
                              ? _buildCard(entity)
                              : _buildDetailsSide(entity, isEven))
                        : _buildDetailsSide(
                            entity,
                            false,
                          ), // Mobile always shows details second
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  /// Helper to build the main Experience Card
  Widget _buildCard(dynamic entity) {
    return ExperienceCardWidget(
      leading: entity.leading,
      title: entity.title,
      subtitle: entity.subtitle,
      year: entity.year,
      techSkillTag: entity.techSkillTag,
    );
  }

  /// Helper to build the details/description side
  Widget _buildDetailsSide(dynamic entity, bool isDesktopEven) {
    return Column(
      // Right-align text if it's on the left side of the timeline on Desktop
      crossAxisAlignment: isDesktopEven
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Project Highlights",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "${entity.highlights}",
          textAlign: isDesktopEven ? TextAlign.end : TextAlign.start,
          style: const TextStyle(
            height: 1.6,
            // color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
