import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/experience_card_constants.dart';
import 'package:ketch4n/core/widgets/glass_card/glass_card_entity.dart';
import 'package:ketch4n/core/widgets/skill_icon/skill_icon_entity.dart';

class WorkExperienceHighlight extends StatefulWidget {
  final GlassCardEntity entity;
  final bool isDesktopEven;
  const WorkExperienceHighlight({
    super.key,
    required this.entity,
    required this.isDesktopEven,
  });

  @override
  State<WorkExperienceHighlight> createState() =>
      _WorkExperienceHighlightState();
}

class _WorkExperienceHighlightState extends State<WorkExperienceHighlight> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // Right-align text if it's on the left side of the timeline on Desktop
      crossAxisAlignment: widget.isDesktopEven
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          ExperienceCardConstants.projectHighlights,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "${widget.entity.highlights}",
          textAlign: widget.isDesktopEven ? TextAlign.end : TextAlign.start,
          style: const TextStyle(
            height: 1.6,
            // color: Colors.white70,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 20),
        Row(
          spacing: 12, // Horizontal gap between project items
          // Alternating logic:
          // If Even (Card is on the Left), Details are on the Right -> Align projects to the Right (.end)
          // If Odd (Card is on the Right), Details are on the Left -> Align projects to the Left (.start)
          mainAxisAlignment: widget.isDesktopEven
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: (widget.entity.projects as List<SkillIconEntity>).map((
            project,
          ) {
            return Tooltip(
              message: project.title,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  8,
                ), // Keeps the logo icons clean
                child: Image.asset(
                  project.icon,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.business,
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.5),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
