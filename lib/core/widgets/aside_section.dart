import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/widgets/header_title_bar.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_icons_group.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_icons_group_vm.dart';
import 'package:provider/provider.dart';

class AsideSectionWidget extends StatefulWidget {
  const AsideSectionWidget({super.key});

  @override
  State<AsideSectionWidget> createState() => _AsideSectionWidgetState();
}

class _AsideSectionWidgetState extends State<AsideSectionWidget> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HexaIconsVM>();

    return GlassmorphismWidget(
      height: 490,
      width: double.infinity,
      firstColor: ColorConstants.previewColor,
      child: Column(
        children: [
          HeaderTitleBarWidget(child: PortfolioConfig.detailsPaneTitle),
          _buildTechGrid(viewModel),
        ],
      ),
    );
  }

  Widget _buildTechGrid(HexaIconsVM vm) {
    final categories = vm.categories.entries.toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = constraints.maxWidth / 2;

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
