import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/constants/experience_card_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/widgets/experience_card/experience_card.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';
import 'package:ketch4n/core/widgets/header_title_bar.dart';

class WorkExperiencePage extends StatefulWidget {
  const WorkExperiencePage({super.key});

  @override
  State<WorkExperiencePage> createState() => _WorkExperiencePageState();
}

class _WorkExperiencePageState extends State<WorkExperiencePage> {
  @override
  Widget build(BuildContext context) {
    final experienceData = ExperienceCardConstants.cards;
    return GlassmorphismWidget(
      height: 650,
      width: double.infinity,
      firstColor: ColorConstants.previewColor,
      child: Column(
        children: [
          HeaderTitleBarWidget(child: PortfolioConfig.workExperience),

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
