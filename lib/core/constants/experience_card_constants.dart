import 'package:ketch4n/data/entities/experience_card_entity.dart';

class ExperienceCardConstants {
  ExperienceCardConstants._();

  static const cards = <ExperienceCardEntity>[
    ExperienceCardEntity(
      title: "Software Developer - TS2",
      leading: "assets/company_logo/ais.jpg",
      subtitle: "Alliance Software Inc.",
      year: "2024-2026",
      techSkillTag: ["Angular", "Kotlin", "Azure DevOps", "Git"],
    ),
    ExperienceCardEntity(
      title: "Full Stack Developer",
      leading: "assets/company_logo/fluravel.png",
      subtitle: "Freelance",
      year: "2022-2024",
      techSkillTag: ["Flutter", "Laravel", "Firebase", "MySQL"],
    ),
    ExperienceCardEntity(
      title: "Web Developer",
      leading: "assets/company_logo/oro.png",
      subtitle: "Oroquieta City - LGU",
      year: "2021-2022",
      techSkillTag: ["Laravel", "MySQL", "Adobe Photoshop"],
    ),
  ];
}
