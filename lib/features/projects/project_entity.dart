class ProjectEntity {
  final String appName;
  final String longName;
  final String iconPath;
  final List<String> mockup;
  // final String githubLink;
  // final String demoLink;
  // final String description;
  // final String useCase;
  // final List<SkillIconEntity> techStack;
  final int type;

  ProjectEntity({
    required this.appName,
    required this.longName,
    required this.iconPath,
    required this.mockup,
    // required this.githubLink,
    // required this.demoLink,
    // required this.description,
    // required this.useCase,
    // required this.techStack,
    required this.type,
  });
}
