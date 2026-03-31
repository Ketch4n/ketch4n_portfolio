import 'package:ketch4n/features/projects/project_entity.dart';

class ProjectConstants {
  ProjectConstants._();

  static final projects = <ProjectEntity>[
    ProjectEntity(
      appName: "Face Recognition - NMSCST",
      longName: "Attendance System with Geolocation and Facial Recognition",
      iconPath: "assets/project_icon/face.jpg",
      // type: 0,
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
      githubLink:
          "https://github.com/Ketch4n/ATTENDANCE-NMSCT/tree/mobile_prod",
      // demoLink: '',
      description:
          "This project is an attendance system that utilizes geolocation and "
          "facial recognition technology to accurately track and manage attendance. "
          "It is designed to enhance security and streamline the attendance process "
          "for educational institutions or organizations.",
      useCase: [
        UseCaseEntity(
          problem:
              "Traditional attendance systems are prone to inaccuracies and "
              "can be easily manipulated.",
          solution:
              "A secure and efficient system that uses facial recognition, server time, "
              "and geolocation to ensure accurate attendance tracking.",
        ),
      ],
      clientDetails: ClientDetailsEntity(
        name: "NMSCST",
        logoPath: "assets/company_logo/nmscst.jpg",
        sector: "Students from NMSCST",
        type: "Thesis",
      ),
      tag: ["Freelance", "Tensorflow", "Flutter"],
      adminScreenshot: AdminScreenshotEntity(
        title: "Admin Dashboard",
        description:
            "The admin dashboard provides an overview of attendance records, "
            "registering establishment geolocation, generate student report, and manage student information.",
        imagePath: [
          'assets/project_ss/face_recognition_nmscst/admin_a.jpg',
          'assets/project_ss/face_recognition_nmscst/admin_b.jpg',
        ],
        tag: [
          "Flutter Web",
          "Laravel",
          "PHP",
          "MySQL",
          "Firebase",
          "Hostinger",
          "Google Maps API",
        ],
      ),
      // techStack: [
      //   SkillIconEntity(title: 'Flutter', icon: "assets/logo/flutter.png"),
      //   SkillIconEntity(title: 'Dart', icon: "assets/logo/dart.png"),
      //   SkillIconEntity(title: 'Firebase', icon: "assets/logo/firebase.png"),
      //   SkillIconEntity(title: 'Hive', icon: "assets/logo/hive.png"),
      //   SkillIconEntity(title: 'Riverpod', icon: "assets/logo/riverpod.png"),
      // ],
    ),
    ProjectEntity(
      appName: "Repository Management System - USTP",
      longName: "Online Archive for Academic Resources",
      iconPath: "assets/company_logo/ustp2.jpg",
      mockup: const [
        'assets/project_ss/repository_ustp/a.png',
        'assets/project_ss/repository_ustp/b.png',
        'assets/project_ss/repository_ustp/c.png',
        'assets/project_ss/repository_ustp/d.png',
        'assets/project_ss/repository_ustp/e.png',
        'assets/project_ss/repository_ustp/f.png',
      ],

      githubLink: "https://github.com/Ketch4n/REPOSITORY-USTP",

      description:
          "The system aims to provide an efficient and organized way to manage and access various repositories,"
          "such as research papers, projects, and other academic resources. "
          "It is intended to enhance collaboration and knowledge sharing among students, faculty, and researchers at USTP.",
      useCase: [
        UseCaseEntity(
          problem:
              "Managing and accessing academic resources can be disorganized and inefficient."
              "Students, faculty, and researchers need a centralized system to manage repositories effectively.",
          solution:
              "A repository management system that allows users to easily upload, organize, and access various academic resources, "
              "enhancing collaboration and knowledge sharing within the USTP community.",
        ),
      ],
      clientDetails: ClientDetailsEntity(
        name: "USTP",
        logoPath: "assets/company_logo/ustp2.jpg",
        sector: "Students from USTP",
        type: "Thesis",
      ),
      tag: ["Freelance", "Flutter Web"],
      adminScreenshot: AdminScreenshotEntity(
        title: "Admin Dashboard",
        description:
            "The admin dashboard provides an overview of repository management, "
            "allowing administrators to monitor and manage academic resources.",
        imagePath: [
          'assets/project_ss/repository_ustp/admin_a.jpg',
          'assets/project_ss/repository_ustp/admin_b.jpg',
          'assets/project_ss/repository_ustp/admin_c.jpg',
        ],
        tag: ["Flutter Web", "Laravel", "MySQL", "Firebase", "Hostinger"],
      ),
    ),
    ProjectEntity(
      appName: "Document Request - USTP",
      longName: "Online Document Request for MIS",
      iconPath: "assets/company_logo/mobod.jpg",
      mockup: const [
        'assets/project_ss/document_request_ustp/a.jpg',
        'assets/project_ss/document_request_ustp/b.jpg',
        'assets/project_ss/document_request_ustp/c.jpg',
        'assets/project_ss/document_request_ustp/d.jpg',
        'assets/project_ss/document_request_ustp/e.jpg',
        'assets/project_ss/document_request_ustp/f.jpg',
      ],

      githubLink: "https://github.com/Ketch4n/DOCUMENT-REQUEST",

      description:
          "This project is a document request application designed"
          "The application aims to enhance efficiency and safety by reducing"
          "the need for physical visits to the campus during the pandemic.",
      useCase: [
        UseCaseEntity(
          problem:
              "Requesting of documents onsite during the PANDEMIC is difficult and risky."
              "Students need a safe and efficient way to request documents without physical visits.",
          solution:
              "A streamlined system that allows students to request documents online, "
              "track their requests, and receive notifications on the status of their requests.",
        ),
      ],
      tag: ["Freelance", "Firebase", "Flutter"],
      clientDetails: ClientDetailsEntity(
        name: "USTP",
        logoPath: "assets/company_logo/ustp2.jpg",
        sector: "Students from USTP",
        type: "Thesis",
      ),
    ),
    ProjectEntity(
      appName: "Expensar - Subscription and Finance Tracker",
      longName: "AI-Powered Subscription Intelligence",
      iconPath: "assets/icon_logo/flutter.png",
      description:
          "Expensar simplifies financial tracking by focusing on subscription management. "
          "It uses AI to identify recurring costs and provides a dashboard for smart financial decision-making. ",

      // type: 0,
      useCase: [
        UseCaseEntity(
          problem:
              "Forgotten subscriptions leading to money loss."
              "Automated tracking and AI-driven alerts.",
          solution:
              "An app that identifies and tracks subscriptions, providing insights"
              "and alerts to help users manage their finances effectively.",
        ),
      ],
      mockup: const ['assets/icon_logo/flutter.png'],
      githubLink: "https://github.com/Ketch4n/Expensar",
      tag: ["Personal", "In Development", "Flutter"],
    ),

    // ProjectEntity(
    //   appName: "Online Ordering System - Chopstick Restobar",
    //   longName: "Online Ordering System for Chopstick Restobar",
    //   iconPath: "assets/project_icon/online_ordering.jpg",
    //   mockup: const [
    //     'assets/projects/ss/online_ordering/chopstick/a.jpg',
    //     'assets/projects/ss/online_ordering/chopstick/b.jpg',
    //     'assets/projects/ss/online_ordering/chopstick/c.jpg',
    //     'assets/projects/ss/online_ordering/chopstick/d.jpg',
    //   ],
    //   type: 0,
    //   githubLink: '',
    //   demoLink: '',
    //   description: '',
    //   useCase: '',
    //   techStack: [],
    // ),
    // ProjectEntity(
    //   appName: "Inventory Management System - AgriVet",
    //   longName: "Inventory Management System for AgriVet",
    //   iconPath: "assets/project_icon/inventory.jpg",
    //   mockup: const [
    //     'assets/projects/ss/inventory/agrivet/a.jpg',
    //     'assets/projects/ss/inventory/agrivet/b.jpg',
    //     'assets/projects/ss/inventory/agrivet/c.jpg',
    //     'assets/projects/ss/inventory/agrivet/d.jpg',
    //   ],
    //   type: 0,
    //   githubLink: '',
    //   demoLink: '',
    //   description: '',
    //   useCase: '',
    //   techStack: [],
    // ),
    // ProjectEntity(
    //   appName: "Job Portal - Peso Oroquieta",
    //   longName: "Job Portal for Peso Oroquieta",
    //   iconPath: "assets/project_icon/job_portal.jpg",
    //   mockup: const [
    //     'assets/projects/ss/job_portal/peso_oroquieta/a.jpg',
    //     'assets/projects/ss/job_portal/peso_oroquieta/b.jpg',
    //     'assets/projects/ss/job_portal/peso_oroquieta/c.jpg',
    //     'assets/projects/ss/job_portal/peso_oroquieta/d.jpg',
    //   ],
    //   type: 0,
    //   githubLink: '',
    //   demoLink: '',
    //   description: '',
    //   useCase: '',
    //   techStack: [],
    // ),
    // ProjectEntity(
    //   appName: "Read Manga - Auto Translation",
    //   longName: "Auto Translation for Read Manga",
    //   iconPath: "assets/project_icon/read_manga.jpg",
    //   mockup: const [
    //     'assets/projects/ss/read_manga/auto_translation/a.jpg',
    //     'assets/projects/ss/read_manga/auto_translation/b.jpg',
    //     'assets/projects/ss/read_manga/auto_translation/c.jpg',
    //     'assets/projects/ss/read_manga/auto_translation/d.jpg',
    //   ],
    //   type: 0,
    //   githubLink: '',
    //   demoLink: '',
    //   description: '',
    //   useCase: '',
    //   techStack: [],
    // ),
  ];
}
