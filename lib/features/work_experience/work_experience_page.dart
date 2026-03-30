import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/experience_card_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/constants/layout_constraints.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart';
import 'package:ketch4n/core/widgets/glass_card/glass_card.dart';
import 'package:ketch4n/features/work_experience/work_experience_highlight.dart';

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
      constraints: LayoutConstraints.pageMaxWidth,
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
                              ? GlassCardWidget(cardEntity: entity)
                              : WorkExperienceHighlight(
                                  entity: entity,
                                  isDesktopEven: isEven,
                                ))
                        : GlassCardWidget(
                            cardEntity: entity,
                          ), // Mobile always shows card first
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
                              ? GlassCardWidget(cardEntity: entity)
                              : WorkExperienceHighlight(
                                  entity: entity,
                                  isDesktopEven: isEven,
                                ))
                        : WorkExperienceHighlight(
                            entity: entity,
                            isDesktopEven: false,
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
}
