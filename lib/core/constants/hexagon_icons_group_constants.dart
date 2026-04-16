import 'package:ketch4n/core/widgets/skill_icon/skill_icon_entity.dart';

class HexagonIconsGroupContants {
  HexagonIconsGroupContants._(); // Prevent instantiation

  static const String frameworksConst = "Frontend";
  static const String backendConst = "Backend";
  static const String cicdConst = "CI / CD";
  static const String toolsConst = "Tools";
  static const String stateManagementConst = "State Management";
  static const String uiuxConst = "UI / UX";
  static const String mlConst = "ML";

  static const mainStack = <SkillIconEntity>[
    SkillIconEntity(title: 'Flutter', icon: 'assets/logo/flutter.png'),
    SkillIconEntity(title: 'Angular', icon: 'assets/logo/angular.png'),
    SkillIconEntity(title: 'Tailwind', icon: 'assets/logo/tailwindcss.png'),
  ];

  static const backend = <SkillIconEntity>[
    SkillIconEntity(title: 'Laravel', icon: 'assets/logo/laravel.png'),
    SkillIconEntity(title: 'Csharp', icon: 'assets/logo/c-sharp.png'),
    SkillIconEntity(title: 'MySQL', icon: 'assets/logo/MySQL.png'),
    SkillIconEntity(title: 'Sqlite', icon: 'assets/logo/sqlite.png'),
    SkillIconEntity(title: 'Firebase', icon: 'assets/logo/firebase.png'),
  ];

  static const cicd = <SkillIconEntity>[
    SkillIconEntity(title: 'CodeMagic', icon: 'assets/logo/codemagic.png'),
    SkillIconEntity(title: 'Supabase', icon: 'assets/logo/supabase.png'),
    SkillIconEntity(title: 'Azure', icon: 'assets/logo/azure.png'),
    SkillIconEntity(title: 'Shorebird', icon: 'assets/logo/shorebird.png'),
    SkillIconEntity(title: 'Docker', icon: 'assets/logo/docker.png'),
    SkillIconEntity(
      title: 'Google Cloud',
      icon: 'assets/logo/google-cloud.png',
    ),
    SkillIconEntity(title: 'Hostinger', icon: 'assets/logo/hostinger.png'),
  ];

  static const tools = <SkillIconEntity>[
    SkillIconEntity(title: 'VS Code', icon: 'assets/logo/vscode.png'),
    SkillIconEntity(
      title: 'Android Studio',
      icon: 'assets/logo/android-studio.png',
    ),
    SkillIconEntity(title: 'Git', icon: 'assets/logo/git.png'),
    SkillIconEntity(title: 'Postman', icon: 'assets/logo/postman.png'),
  ];

  static const stateManagement = <SkillIconEntity>[
    SkillIconEntity(title: 'Bloc', icon: 'assets/logo/bloc.png'),
    SkillIconEntity(title: 'Riverpod', icon: 'assets/logo/riverpod.png'),
    SkillIconEntity(title: 'Provider', icon: 'assets/logo/dart.png'),
  ];

  static const uiux = <SkillIconEntity>[
    SkillIconEntity(title: 'Photoshop', icon: 'assets/logo/adobe-ps.png'),
    SkillIconEntity(title: 'Figma', icon: 'assets/logo/figma.png'),
  ];

  static const ml = <SkillIconEntity>[
    SkillIconEntity(title: 'TensorFlow', icon: 'assets/logo/tensorflow.png'),
    SkillIconEntity(title: 'Ollama', icon: 'assets/logo/ollama2.png'),
  ];

  static const ide = <SkillIconEntity>[
    SkillIconEntity(title: 'VS', icon: 'assets/logo/visual-studio.png'),
    SkillIconEntity(title: 'Android', icon: 'assets/logo/android-studio.png'),
  ];
}
