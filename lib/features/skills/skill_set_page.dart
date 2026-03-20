import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/constants/hexagon_icons_group_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_icons_group.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_icons_group_vm.dart';
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
      // color: Colors.green,
      constraints: BoxConstraints(maxWidth: 900),
      child: GlassmorphismWidget(
        leftMargin: 0,
        rightMargin: 0,
        height: 400,
        width: double.infinity,
        firstColor: ColorConstants.previewColor,
        child: Column(
          children: [
            // HeaderTitleBarWidget(child: PortfolioConfig.detailsPaneTitle),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: BeamAnimation(title: "Tech-Stack Toolkit"),
            ),
            Row(
              mainAxisAlignment: .center,
              spacing: 10,
              children: techList
                  .map(
                    (tech) => Container(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: TextTagWidget(text: tech),
                    ),
                  )
                  .toList(),
            ),
            Center(child: _buildTechGrid(viewModel)),
          ],
        ),
      ),
    );
  }

  Widget _buildTechGrid(HexaIconsVM vm) {
    final categories = vm.categories.entries.toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = constraints.maxWidth / 7;

          return Wrap(
            children: categories.map((category) {
              return SizedBox(
                width: itemWidth,
                child: HexagonIconsGroupWidget(
                  title: category.key,
                  items: category.value,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
