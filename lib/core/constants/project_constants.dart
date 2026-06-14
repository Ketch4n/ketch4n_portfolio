import 'package:ketch4n/features/projects/domain/entities/admin_screens_entity.dart';
import 'package:ketch4n/features/projects/domain/entities/client_details_entity.dart';
import 'package:ketch4n/features/projects/domain/entities/project_entity.dart';
import 'package:ketch4n/features/projects/domain/entities/use_case_entity.dart';

class ProjectConstants {
  ProjectConstants._();

  static final projects = <ProjectEntity>[
    ProjectEntity(
      appName: "Expensar",
      longName: "Subscription and Finance Tracker with AI",
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

    // FACE RECOGNITION - NMSCST
    ProjectEntity(
      appName: "Attendance NMSCST",
      longName: "Face Recognition Attendance with Geolocation",
      iconPath: "assets/project_icon/face.jpg",

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
    ),

    // REPOSITORY - USTP
    ProjectEntity(
      appName: "UpPARADor",
      longName: "Academic resource repository with Cloud Storage",
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
        logoPath: "assets/company_logo/ustp1.jpg",
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

    // DOCU - USTP
    ProjectEntity(
      appName: "Docu-USTP",
      longName: "Online Document Request with Notifications",
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
        logoPath: "assets/company_logo/ustp1.jpg",
        sector: "Students from USTP",
        type: "Project",
      ),
    ),

    // INVENTORY CS
    ProjectEntity(
      appName: "Oro-AgriVet",
      longName: "Inventory Management System in 3 platform",
      iconPath: "assets/company_logo/box.png",
      mockup: const [
        // 'assets/project_ss/inventory_cs/a.jpg',
        'assets/project_ss/inventory_cs/b.jpg',
        'assets/project_ss/inventory_cs/c.jpg',
        'assets/project_ss/inventory_cs/d.jpg',
        'assets/project_ss/inventory_cs/e.jpg',
        'assets/project_ss/inventory_cs/f.jpg',
      ],

      githubLink: "https://github.com/Ketch4n/INVENTORY-CS",

      description:
          "This project is an inventory management system designed for AgriVet, a local agricultural store in Oroquieta. "
          "The system aims to streamline inventory tracking, manage stock levels, and enhance overall efficiency in the store's operations.",
      useCase: [
        UseCaseEntity(
          problem:
              "The owner wants automation of process in their growing business",
          solution:
              "Develope and Deploy a Desktop, Mobile and Web App for them",
        ),
      ],
      tag: ["Freelance", "C#", "Flutter"],
      clientDetails: ClientDetailsEntity(
        name: "Oro-AgriVet",
        logoPath: "assets/company_logo/oro.png",
        sector: "Local Business in Oroquieta",
        type: "Business Project",
      ),
    ),

    // Chopstick
    ProjectEntity(
      appName: "Chopstick Restobar",
      longName: "Dine-in Menu App with Online Ordering and Tracking",
      iconPath: "assets/company_logo/chopstick.jpg",
      mockup: const ["assets/company_logo/chopstick.jpg"],

      description:
          "This project is a dine-in menu application designed for Chopstick Restobar, a local restaurant in Oroquieta. "
          "The application aims to enhance the dining experience by providing an interactive menu, allowing customers to place orders online, and track their orders in real-time.",
      useCase: [
        UseCaseEntity(
          problem:
              "The restaurant wants to expand their business by accepting online orders."
              "And also to automate the dine-in process using tablet as menu.",
          solution:
              "Develope and Deploy a Mobile and Web App for them to accept online orders"
              "and also to automate the dine-in process using tablet as menu.",
        ),
      ],
      tag: ["Thesis", "PHP", "Flutter"],
      clientDetails: ClientDetailsEntity(
        name: "Chopstick Restobar",
        logoPath: "assets/company_logo/chopstick.jpg",
        sector: "Local Business in Oroquieta",
        type: "Business Thesis",
      ),
    ),
  ];
}
