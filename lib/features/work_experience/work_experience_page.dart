import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/experience_card_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
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
    return Container(
      constraints: BoxConstraints(maxWidth: 900),
      child: Column(
        children: [
          BeamAnimation(title: PortfolioConfig.workExperience),

          ...experienceData.map(
            (entity) => ExperienceCardWidget(
              leading: entity.leading,
              title: entity.title,
              subtitle: entity.subtitle,
              year: entity.year,
              techSkillTag: entity.techSkillTag,
            ),
          ),
        ],
      ),
    );
  }
}
