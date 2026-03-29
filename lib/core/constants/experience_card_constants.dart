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
      highlights: [
        "Implemented Angular TS front-end modules for enterprise booking platforms (CebuPac Airlines)",
        "Developed Android applications using Kotlin and Android Studio and uploads in Play Store (StampMe)",
        "Mentored junior developers in Flutter and mobile development best practices (Unilab).",
      ],
    ),
    ExperienceCardEntity(
      title: "Full Stack Developer",
      leading: "assets/company_logo/fluravel.png",
      subtitle: "Freelance",
      year: "2022-2024",
      techSkillTag: ["Flutter", "Laravel", "Firebase", "MySQL"],
      highlights: [
        "Delivered 10+ mobile and web applications for business owners and academic research projects",
        "Architected and developed scalable Flutter mobile applications using modular architecture",
        "Integrated RESTful APIs, Firebase services, and cloud-based data systems.",
      ],
    ),
    ExperienceCardEntity(
      title: "Web Developer",
      leading: "assets/company_logo/oro.png",
      subtitle: "Oroquieta City - LGU",
      year: "2021-2022",
      techSkillTag: ["Laravel", "MySQL", "Adobe Photoshop"],
      highlights: [
        "Defined mobile architecture standards using MVVM, MVC and Clean Architecture.",
      ],
    ),
  ];
}
