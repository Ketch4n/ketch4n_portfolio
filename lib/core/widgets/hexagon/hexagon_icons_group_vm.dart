import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/hexagon_icons_group_constants.dart';
import 'package:ketch4n/core/widgets/skill_icon/skill_icon_entity.dart';

class HexaIconsVM extends ChangeNotifier {
  final Map<String, List<SkillIconEntity>> categories = {
    HexagonIconsGroupContants.stateManagementConst:
        HexagonIconsGroupContants.stateManagement,
    HexagonIconsGroupContants.frameworksConst:
        HexagonIconsGroupContants.mainStack,
    HexagonIconsGroupContants.backendConst: HexagonIconsGroupContants.backend,
    HexagonIconsGroupContants.cicdConst: HexagonIconsGroupContants.cicd,
    HexagonIconsGroupContants.toolsConst: HexagonIconsGroupContants.tools,
    HexagonIconsGroupContants.mlConst: HexagonIconsGroupContants.ml,
    HexagonIconsGroupContants.uiuxConst: HexagonIconsGroupContants.uiux,
  };

  // Helper method for the UI
  // List<TechIconEntity> getStackByCategory(String title) {
  //   return categories[title] ?? [];
  // }
}
