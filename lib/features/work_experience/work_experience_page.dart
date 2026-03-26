import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/experience_card_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/constants/size_constants.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart'; // Assuming your Responsive util is here
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
          BeamAnimation(title: PortfolioConfig.workExperience),
          const SizedBox(height: 40),

          // Use asMap().entries to get the index for alternating logic
          ...experienceData.asMap().entries.map((entry) {
            int index = entry.key;
            var entity = entry.value;
            bool isEven = index % 2 == 0;

            return Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Flex(
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // LEFT SIDE
                  Flexible(
                    flex: isDesktop ? 1 : 0,
                    child: isEven || !isDesktop
                        ? ExperienceCardWidget(
                            leading: entity.leading,
                            title: entity.title,
                            subtitle: entity.subtitle,
                            year: entity.year,
                            techSkillTag: entity.techSkillTag,
                          )
                        : _buildDetailsSide(entity), // Show details if odd
                  ),

                  // THE CENTER LINE (Optional visual spacer)
                  if (isDesktop)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: const Icon(
                        Icons.circle,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ),

                  // RIGHT SIDE
                  if (isDesktop)
                    Flexible(
                      flex: 1,
                      child: !isEven
                          ? ExperienceCardWidget(
                              leading: entity.leading,
                              title: entity.title,
                              subtitle: entity.subtitle,
                              year: entity.year,
                              techSkillTag: entity.techSkillTag,
                            )
                          : _buildDetailsSide(entity), // Show details if even
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // Placeholder for the "Other Side" details
  Widget _buildDetailsSide(dynamic entity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Project Highlights",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Detailed description of tasks and achievements at ${entity.title}. Focus on specific impacts and growth.",
          style: const TextStyle(height: 1.5),
        ),
      ],
    );
  }
}
