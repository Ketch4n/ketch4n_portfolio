class ProjectEntity {
  final String appName;
  final String longName;
  final String iconPath;
  final List<String> mockup;
  final String? githubLink;
  // final String demoLink;
  final String description;
  final List<UseCaseEntity> useCase;
  final List<String> tag;
  // final List<SkillIconEntity> techStack;
  // final int type;
  final ClientDetailsEntity? clientDetails;
  final AdminScreenshotEntity? adminScreenshot;

  ProjectEntity({
    required this.appName,
    required this.longName,
    required this.iconPath,
    required this.mockup,
    this.githubLink,
    // required this.demoLink,
    required this.description,
    required this.useCase,
    required this.tag,
    // required this.techStack,
    // required this.type,
    this.clientDetails,
    this.adminScreenshot,
  });
}

class ClientDetailsEntity {
  final String name;
  final String logoPath;
  final String sector;
  final String type;

  ClientDetailsEntity({
    required this.name,
    required this.logoPath,
    required this.sector,
    required this.type,
  });
}

class UseCaseEntity {
  final String problem;
  final String solution;

  UseCaseEntity({required this.problem, required this.solution});
}

class AdminScreenshotEntity {
  final String title;
  final String description;
  final List<String> tag;
  final List<String> imagePath;

  AdminScreenshotEntity({
    required this.title,
    required this.description,
    required this.tag,
    required this.imagePath,
  });
}
