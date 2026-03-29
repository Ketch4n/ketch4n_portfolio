import 'package:ketch4n/features/projects/project_model.dart';

class ProjectConstants {
  ProjectConstants._();

  static final projects = <ProjectModel>[
    ProjectModel(
      appName: "Face Recognition Attendance App",
      mockup: "assets/projects/face_recognition_attendance_app.png",
      githubLink: "https://github.com/flutter/face-recognition-attendance-app",
      demoLink: "https://flutter.dev/face-recognition-attendance-app",
      description: "A face recognition attendance app built with Flutter.",
      type: 0,
    ),
    ProjectModel(
      appName: "Document Request App",
      mockup: "assets/projects/document_request_app.png",
      githubLink: "https://github.com/flutter/document-request-app",
      demoLink: "https://flutter.dev/document-request-app",
      description: "A document request app built with Flutter.",
      type: 0,
    ),
    ProjectModel(
      appName: "Expensar",
      mockup: "assets/projects/chat_app.png",
      githubLink: "https://github.com/flutter/chat-app",
      demoLink: "https://flutter.dev/chat-app",
      description:
          "A real-time chat application built with Flutter and Firebase.",
      type: 0,
    ),
    ProjectModel(
      appName: "Online Ordering System",
      mockup: "assets/projects/online_ordering_system.png",
      githubLink: "https://github.com/flutter/online-ordering-system",
      demoLink: "https://flutter.dev/online-ordering-system",
      description: "An online ordering system built with Flutter.",
      type: 1,
    ),
    ProjectModel(
      appName: "Job Portal App",
      mockup: "assets/projects/job_portal_app.png",
      githubLink: "https://github.com/flutter/job-portal-app",
      demoLink: "https://flutter.dev/job-portal-app",
      description: "A job portal application built with Flutter.",
      type: 1,
    ),
    ProjectModel(
      appName: "Inventory Management System",
      mockup: "assets/projects/inventory_management_system.png",
      githubLink: "https://github.com/flutter/inventory-management-system",
      demoLink: "https://flutter.dev/inventory-management-system",
      description: "An inventory management system built with Flutter.",
      type: 1,
    ),
  ];
}
