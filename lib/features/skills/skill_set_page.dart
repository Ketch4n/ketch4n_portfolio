import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/hexagon_icons_group_constants.dart';
import 'package:ketch4n/core/constants/layout_constraints.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_icons_group_vm.dart';
import 'package:ketch4n/core/widgets/skill_icon/skill_icon.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';
import 'package:provider/provider.dart';

class SkillSetPage extends StatefulWidget {
  const SkillSetPage({super.key});

  @override
  State<SkillSetPage> createState() => _SkillSetPageState();
}

class _SkillSetPageState extends State<SkillSetPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HexaIconsVM>();
    // final bool isMobile = Responsive.isMobile(context);
    // final bool isTablet = Responsive.isTablet(context);

    // Define techList here so it is available within the build scope
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

                // The Individual Icons Wrap
                _buildIndividualIconsWrap(viewModel),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndividualIconsWrap(HexaIconsVM vm) {
    // This flattens the Map<String, List<SkillIconEntity>> into one List<SkillIconEntity>
    final allIcons = vm.categories.values.expand((list) => list).toList();

    return Wrap(
      alignment: WrapAlignment.center,
      // spacing: 15, // Horizontal space between hexagons
      // runSpacing: 0, // Vertical space between rows
      children: allIcons.map((item) {
        return SkillIconWidget(assetPath: item.icon, text: item.title);
      }).toList(),
    );
  }
}
