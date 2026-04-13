import 'package:ketch4n/core/widgets/glass_card/glass_card_entity.dart';
import 'package:ketch4n/core/widgets/skill_icon/skill_icon_entity.dart';

class ExperienceCardConstants {
  ExperienceCardConstants._();

  static const String projectHighlights = "Project Highlights";

  static const cards = <GlassCardEntity>[
    GlassCardEntity(
      title: "Software Developer - TS2",
      leading: "assets/company_logo/ais.jpg",
      subtitle: "Alliance Software Inc.",
      trailing: "2024-2026",
      techSkillTag: [
        "Angular",
        "Kotlin",
        "Flutter",
        "Azure DevOps",
        "Git",
        "PostgreSQL",
        "REST API",
        "Agile",
        "Scrum",
      ],
      highlights: [
        "Implemented Angular TS front-end modules for enterprise booking platforms (CebuPac Airlines)",
        "Developed Android applications using Kotlin and Android Studio and uploads in Play Store (StampMe)",
        "Mentored junior developers in Flutter and mobile development best practices (Unilab).",
      ],
      projects: [
        SkillIconEntity(
          title: 'Cebu Pacific Airlines (Angular)',
          icon: "assets/project_icon/cebpac.jpg",
        ),
        SkillIconEntity(
          title: 'Unilab (Flutter)',
          icon: "assets/project_icon/unilab.jpg",
        ),
        SkillIconEntity(
          title: 'Stamp Me (Kotlin)',
          icon: "assets/project_icon/stampme.jpg",
        ),
      ],
    ),
    GlassCardEntity(
      title: "Full Stack Developer",
      leading: "assets/company_logo/fluravel.png",
      subtitle: "Freelance | Independent",
      trailing: "2021-2024",
      techSkillTag: [
        "Flutter",
        "Laravel",
        "Firebase",
        "MySQL",
        "REST API",
        "Git",
        "Hosting",
        "Google Cloud",
        "TensorFlow",
      ],
      highlights: [
        "Delivered 7 + mobile and web applications for business owners and academic research projects",
        "Architected and developed scalable Flutter mobile applications using modular architecture",
        "Integrated RESTful APIs, Firebase services, and cloud-based data systems.",
      ],
      projects: [],
      textTag: ["3 Academic Applications", " 2 Local Businesses Systems"],
    ),
  ];
}
