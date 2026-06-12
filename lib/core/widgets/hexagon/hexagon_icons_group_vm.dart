import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/core/constants/hexagon_icons_group_constants.dart';
import 'package:ketch4n/core/widgets/skill_icon/skill_icon_entity.dart';

final hexaIconsProvider = Provider<Map<String, List<SkillIconEntity>>>((ref) {
  return {
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
});
