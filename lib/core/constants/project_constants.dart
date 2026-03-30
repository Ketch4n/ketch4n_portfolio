import 'package:ketch4n/features/projects/project_entity.dart';

class ProjectConstants {
  ProjectConstants._();

  static final projects = <ProjectEntity>[
    ProjectEntity(
      appName: "Face Recognition - NMSCST",
      longName: "Attendance System with Geolocation and Facial Recognition",
      iconPath: "assets/project_icon/face.jpg",
      type: 0,
      mockup: const [
        'assets/project_ss/face_recognition_nmscst/a.jpg',
        'assets/project_ss/face_recognition_nmscst/b.jpg',
        'assets/project_ss/face_recognition_nmscst/c.jpg',
        'assets/project_ss/face_recognition_nmscst/d.jpg',
        'assets/project_ss/face_recognition_nmscst/e.jpg',
        'assets/project_ss/face_recognition_nmscst/f.jpg',
        'assets/project_ss/face_recognition_nmscst/g.jpg',
        'assets/project_ss/face_recognition_nmscst/h.jpg',
      ],
      // techStack: [
      //   SkillIconEntity(title: 'Flutter', icon: "assets/logo/flutter.png"),
      //   SkillIconEntity(title: 'Dart', icon: "assets/logo/dart.png"),
      //   SkillIconEntity(title: 'Firebase', icon: "assets/logo/firebase.png"),
      //   SkillIconEntity(title: 'Hive', icon: "assets/logo/hive.png"),
      //   SkillIconEntity(title: 'Riverpod', icon: "assets/logo/riverpod.png"),
      // ],
    ),
    ProjectEntity(
      appName: "Expensar - Subscription and Finance Tracker",
      longName: "AI-Powered Subscription Intelligence",
      iconPath: "assets/icon_logo/flutter.png",
      // description:
      //     "Expensar simplifies financial tracking by focusing on subscription management."
      //     "It uses AI to identify recurring costs and provides a dashboard for smart financial decision-making.",
      type: 0,
      // useCase:
      //     "• Problem: Forgotten subscriptions leading to money loss.\n"
      //     "• Solution: Automated tracking and AI-driven alerts.",
      mockup: const [
        'assets/projects/ss/a.jpg',
        'assets/projects/ss/b.jpg',
        'assets/projects/ss/c.jpg',
        'assets/projects/ss/d.jpg',
      ],
    ),
    ProjectEntity(
      appName: "Document Request - USTP",
      longName: "Document Request System for USTP",
      iconPath: "assets/project_icon/document_request.jpg",
      mockup: const [
        'assets/projects/ss/document_request_ustp/a.jpg',
        'assets/projects/ss/document_request_ustp/b.jpg',
        'assets/projects/ss/document_request_ustp/c.jpg',
        'assets/projects/ss/document_request_ustp/d.jpg',
      ],
      type: 0,
    ),
    ProjectEntity(
      appName: "Repository Management System - USTP",
      longName: "Repository Management System for USTP",
      iconPath: "assets/project_icon/repository.jpg",
      mockup: const [
        'assets/projects/ss/repository_management/a.jpg',
        'assets/projects/ss/repository_management/b.jpg',
        'assets/projects/ss/repository_management/c.jpg',
        'assets/projects/ss/repository_management/d.jpg',
      ],
      type: 0,
    ),
    ProjectEntity(
      appName: "Online Ordering System - Chopstick Restobar",
      longName: "Online Ordering System for Chopstick Restobar",
      iconPath: "assets/project_icon/online_ordering.jpg",
      mockup: const [
        'assets/projects/ss/online_ordering/chopstick/a.jpg',
        'assets/projects/ss/online_ordering/chopstick/b.jpg',
        'assets/projects/ss/online_ordering/chopstick/c.jpg',
        'assets/projects/ss/online_ordering/chopstick/d.jpg',
      ],
      type: 0,
    ),
    ProjectEntity(
      appName: "Inventory Management System - AgriVet",
      longName: "Inventory Management System for AgriVet",
      iconPath: "assets/project_icon/inventory.jpg",
      mockup: const [
        'assets/projects/ss/inventory/agrivet/a.jpg',
        'assets/projects/ss/inventory/agrivet/b.jpg',
        'assets/projects/ss/inventory/agrivet/c.jpg',
        'assets/projects/ss/inventory/agrivet/d.jpg',
      ],
      type: 0,
    ),
    ProjectEntity(
      appName: "Job Portal - Peso Oroquieta",
      longName: "Job Portal for Peso Oroquieta",
      iconPath: "assets/project_icon/job_portal.jpg",
      mockup: const [
        'assets/projects/ss/job_portal/peso_oroquieta/a.jpg',
        'assets/projects/ss/job_portal/peso_oroquieta/b.jpg',
        'assets/projects/ss/job_portal/peso_oroquieta/c.jpg',
        'assets/projects/ss/job_portal/peso_oroquieta/d.jpg',
      ],
      type: 0,
    ),
    ProjectEntity(
      appName: "Read Manga - Auto Translation",
      longName: "Auto Translation for Read Manga",
      iconPath: "assets/project_icon/read_manga.jpg",
      mockup: const [
        'assets/projects/ss/read_manga/auto_translation/a.jpg',
        'assets/projects/ss/read_manga/auto_translation/b.jpg',
        'assets/projects/ss/read_manga/auto_translation/c.jpg',
        'assets/projects/ss/read_manga/auto_translation/d.jpg',
      ],
      type: 0,
    ),
  ];
}
