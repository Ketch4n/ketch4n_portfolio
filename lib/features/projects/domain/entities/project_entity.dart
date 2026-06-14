import 'package:ketch4n/features/projects/domain/entities/admin_screens_entity.dart';
import 'package:ketch4n/features/projects/domain/entities/client_details_entity.dart';
import 'package:ketch4n/features/projects/domain/entities/use_case_entity.dart';

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
