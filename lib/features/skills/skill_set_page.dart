import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/hexagon_icons_group_constants.dart';
import 'package:ketch4n/core/constants/layout_constraints.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_icons_group_vm.dart';
import 'package:ketch4n/core/widgets/skill_icon/skill_icon.dart';
import 'package:ketch4n/core/widgets/skill_icon/skill_icon_entity.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';

class SkillSetPage extends ConsumerStatefulWidget {
  const SkillSetPage({super.key});

  @override
  ConsumerState<SkillSetPage> createState() => _SkillSetPageState();
}

class _SkillSetPageState extends ConsumerState<SkillSetPage> {
  String? _selectedCategory;
  String? _hoveredCategory;

  String? get _activeCategory => _hoveredCategory ?? _selectedCategory;

  @override
  Widget build(BuildContext context) {
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

    return GestureDetector(
      onTap: () => setState(() => _selectedCategory = null),
      behavior: HitTestBehavior.translucent,
      child: Container(
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
                    children: techList.map((tech) {
                      return MouseRegion(
                        onEnter: (_) => setState(() => _hoveredCategory = tech),
                        onExit: (_) => setState(() => _hoveredCategory = null),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedCategory = _selectedCategory == tech
                                  ? null
                                  : tech;
                            });
                          },
                          child: TextTagWidget(
                            text: tech,
                            isActive: _activeCategory == tech,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  _buildIndividualIconsWrap(categories),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndividualIconsWrap(
    Map<String, List<SkillIconEntity>> categories,
  ) {
    final List<SkillIconEntity> visibleIcons;

    if (_activeCategory != null && categories.containsKey(_activeCategory)) {
      visibleIcons = categories[_activeCategory]!;
    } else {
      visibleIcons = categories.values.expand((list) => list).toList();
    }

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: visibleIcons.map((item) {
          return SkillIconWidget(assetPath: item.icon, text: item.title);
        }).toList(),
      ),
    );
  }
}
