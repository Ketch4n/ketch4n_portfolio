import 'package:ketch4n/data/entities/skill_icon_entity.dart';

class ExperienceCardEntity {
  final String title;
  final String leading;
  final String subtitle;
  final String year;
  final List<String> techSkillTag;
  final List<String> highlights;
  final List<SkillIconEntity> projects;

  const ExperienceCardEntity({
    required this.title,
    required this.leading,
    required this.subtitle,
    required this.year,
    required this.techSkillTag,
    required this.highlights,
    required this.projects,
  });
}
