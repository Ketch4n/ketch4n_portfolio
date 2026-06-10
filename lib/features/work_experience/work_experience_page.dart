import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/experience_card_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/constants/layout_constraints.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart';
import 'package:ketch4n/features/work_experience/widgets/experience_row.dart';

class WorkExperiencePage extends StatelessWidget {
  const WorkExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final experienceData = ExperienceCardConstants.cards;
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      constraints: LayoutConstraints.pageMaxWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const BeamAnimation(title: PortfolioConfig.workExperience),
          const SizedBox(height: 60),
          ...experienceData.asMap().entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: ExperienceRow(
                entity: entry.value,
                isEven: entry.key % 2 == 0,
                isDesktop: isDesktop,
              ),
            );
          }),
        ],
      ),
    );
  }
}
