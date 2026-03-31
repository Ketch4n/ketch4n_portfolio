import 'package:ketch4n/core/widgets/skill_icon/skill_icon_entity.dart';

class GlassCardEntity {
  final String title;
  final String? leading;
  final String? subtitle;
  final String? trailing;
  final List<String>? techSkillTag;
  final List<String>? highlights;
  final List<SkillIconEntity>? projects;
  final List<String>? textTag;

  const GlassCardEntity({
    required this.title,
    this.leading,
    this.subtitle,
    this.trailing,
    this.techSkillTag,
    this.highlights,
    this.projects,
    this.textTag,
  });
}
