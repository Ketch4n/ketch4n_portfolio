import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/core/widgets/skill_icon/skill_icon.dart';
import 'package:ketch4n/core/widgets/skill_icon/skill_icon_entity.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_icons_group_vm.dart';

class HexagonIconsGroupWidget extends ConsumerWidget {
  final String title;
  final List<SkillIconEntity> items;

  const HexagonIconsGroupWidget({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(hexaIconsProvider);
    final items = categories[title] ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 240,
          child: Center(
            child: Column(
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
