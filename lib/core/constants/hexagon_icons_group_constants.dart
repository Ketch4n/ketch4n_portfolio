import 'package:ketch4n/data/entities/skill_icon_entity.dart';

class HexagonIconsGroupContants {
  HexagonIconsGroupContants._(); // Prevent instantiation

  static const String frameworksConst = "Frameworks";
  static const String backendConst = "Backend";
  static const String cicdConst = "CI / CD";
  static const String toolsConst = "Tools";
  static const String stateManagementConst = "State Management";
  static const String uiuxConst = "UI / UX";

  static const mainStack = <SkillIconEntity>[
    SkillIconEntity(title: 'Flutter', icon: 'logo/flutter.png'),
    SkillIconEntity(title: 'Laravel', icon: 'logo/laravel.png'),
    SkillIconEntity(title: 'Angular', icon: 'logo/angular.png'),
  ];

  static const backend = <SkillIconEntity>[
    SkillIconEntity(title: 'Firebase', icon: 'logo/firebase.png'),
    SkillIconEntity(title: 'MySQL', icon: 'logo/mySQL.png'),
    SkillIconEntity(title: 'Csharp', icon: 'logo/csharp.png'),
  ];

  static const cicd = <SkillIconEntity>[
    SkillIconEntity(title: 'Git', icon: 'logo/git.png'),
    SkillIconEntity(title: 'CodeMagic', icon: 'logo/codemagic.png'),
    SkillIconEntity(title: 'Azure', icon: 'logo/azure.png'),
  ];

  static const tools = <SkillIconEntity>[
    SkillIconEntity(title: 'VS Code', icon: 'logo/vscode.png'),
    SkillIconEntity(title: 'Docker', icon: 'logo/docker.png'),
    SkillIconEntity(title: 'Postman', icon: 'logo/postman.png'),
  ];

  static const stateManagement = <SkillIconEntity>[
    SkillIconEntity(title: 'Bloc', icon: 'logo/bloc.png'),
    SkillIconEntity(title: 'Riverpod', icon: 'logo/riverpod.png'),
    SkillIconEntity(title: 'Provider', icon: 'logo/dart.png'),
  ];

  static const uiux = <SkillIconEntity>[
    // SkillIconEntity(title: 'Ollama', icon: 'logo/ollama2.png'),
    SkillIconEntity(title: 'Photoshop', icon: 'logo/adobe-ps.png'),
    SkillIconEntity(title: 'Figma', icon: 'logo/figma.png'),
  ];

  static const ml = <SkillIconEntity>[
    SkillIconEntity(title: 'TensorFlow', icon: 'logo/tensorflow.png'),
    SkillIconEntity(title: 'Ollama', icon: 'logo/ollama2.png'),
    SkillIconEntity(title: 'HuggingFace', icon: 'logo/hf-logo.png'),
  ];

  static const ide = <SkillIconEntity>[
    SkillIconEntity(title: 'VS', icon: 'logo/visual-studio.png'),
    SkillIconEntity(title: 'Android', icon: 'logo/android-studio.png'),
  ];
}
