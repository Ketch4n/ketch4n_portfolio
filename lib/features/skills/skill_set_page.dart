import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/hexagon_icons_group_constants.dart';
import 'package:ketch4n/core/constants/layout_constraints.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_icons_group_vm.dart';
import 'package:ketch4n/core/widgets/skill_icon/skill_icon.dart';
import 'package:ketch4n/core/widgets/skill_icon/skill_icon_entity.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';

class SkillSetPage extends ConsumerWidget {
  const SkillSetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(hexaIconsProvider);

    final techList = [
      HexagonIconsGroupContants.stateManagementConst,
      HexagonIconsGroupContants.frameworksConst,
      HexagonIconsGroupContants.backendConst,
      HexagonIconsGroupContants.cicdConst,
      HexagonIconsGroupContants.toolsConst,
      HexagonIconsGroupContants.mlConst,
      HexagonIconsGroupContants.uiuxConst,
    ];

    return Container(
      constraints: LayoutConstraints.pageMaxWidth,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        spacing: 30,
        children: [
          BeamAnimation(title: "Tech-Stack Toolkit"),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 30,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: techList
                      .map((tech) => TextTagWidget(text: tech))
                      .toList(),
                ),
                _buildIndividualIconsWrap(categories),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndividualIconsWrap(
    Map<String, List<SkillIconEntity>> categories,
  ) {
    final allIcons = categories.values.expand((list) => list).toList();

    return Wrap(
      alignment: WrapAlignment.center,
      children: allIcons.map((item) {
        return SkillIconWidget(assetPath: item.icon, text: item.title);
      }).toList(),
    );
  }
}
