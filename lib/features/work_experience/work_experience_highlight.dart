import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam_border.dart';
import 'package:ketch4n/core/constants/experience_card_constants.dart';
import 'package:ketch4n/core/widgets/glass_card/glass_card_entity.dart';
import 'package:ketch4n/core/widgets/skill_icon/skill_icon_entity.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';

class WorkExperienceHighlight extends StatelessWidget {
  final GlassCardEntity entity;

  const WorkExperienceHighlight({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          ExperienceCardConstants.projectHighlights,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        if (entity.highlights != null)
          ...entity.highlights!.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7, right: 10),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(height: 1.6, fontSize: 14),
                    ),
                  ),
                ],
              ),
            );
          }),
        const SizedBox(height: 20),
        Row(
          spacing: 12,
          children: (entity.projects as List<SkillIconEntity>).map((project) {
            return Tooltip(
              message: project.title,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  project.icon,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => Icon(
                    Icons.business,
                    color: primaryColor.withValues(alpha: 0.5),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        if (entity.textTag != null) ...[
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: (entity.textTag as List<String>).map((tag) {
              return BeamBorderAnimation(child: TextTagWidget(text: tag));
            }).toList(),
          ),
        ],
      ],
    );
  }
}
