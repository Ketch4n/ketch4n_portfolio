import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/glass_card/glass_card.dart';
import 'package:ketch4n/core/widgets/glass_card/glass_card_entity.dart';
import 'package:ketch4n/features/work_experience/widgets/timeline_dot.dart';
import 'package:ketch4n/features/work_experience/work_experience_highlight.dart';

class ExperienceRow extends StatelessWidget {
  final GlassCardEntity entity;
  final bool isEven;
  final bool isDesktop;

  const ExperienceRow({
    super.key,
    required this.entity,
    required this.isEven,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final card = GlassCardWidget(cardEntity: entity);
    final highlight = WorkExperienceHighlight(entity: entity);

    if (!isDesktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [card, const SizedBox(height: 20), highlight],
      );
    }

    final left = isEven ? card : highlight;
    final right = isEven ? highlight : card;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: left),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TimelineDot(color: Theme.of(context).colorScheme.primary),
        ),
        Expanded(child: right),
      ],
    );
  }
}
