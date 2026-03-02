import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/skill_icon.dart';
import 'package:ketch4n/data/entities/skill_icon_entity.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_icons_group_vm.dart';
import 'package:provider/provider.dart';

class HexagonIconsGroupWidget extends StatelessWidget {
  final String title;
  final List<SkillIconEntity> items; // Pass data in directly

  const HexagonIconsGroupWidget({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HexaIconsVM>();
    final items = viewModel.categories[title] ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.white70),
        ),
        // const SizedBox(height: 10),
        SizedBox(
          height: 90,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: items
                  .map(
                    (item) =>
                        SkillIconWidget(assetPath: item.icon, text: item.title),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
