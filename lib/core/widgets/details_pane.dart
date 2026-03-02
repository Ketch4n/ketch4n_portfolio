import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_icons_group.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';
// import 'package:ketch4n/core/widgets/typing_controller.dart';
import 'package:ketch4n/core/widgets/hexagon/hexagon_icons_group_vm.dart';
import 'package:provider/provider.dart';

class DetailsPaneWidget extends StatefulWidget {
  const DetailsPaneWidget({super.key});

  @override
  State<DetailsPaneWidget> createState() => _DetailsPaneWidgetState();
}

class _DetailsPaneWidgetState extends State<DetailsPaneWidget> {
  // final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // Access the VM here so the build method can see it
    final viewModel = context.watch<HexaIconsVM>();

    return Container(
      height: double.infinity,
      decoration: BoxDecoration(color: ColorConstants.previewColor),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          _buildHeader(),
          _buildTechGrid(viewModel),
          // _buildTerminalSection(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const GlassmorphismWidget(
      width: double.infinity,
      height: 50,
      borderRadius: 10,
      child: Center(
        child: Text(
          PortfolioConfig.detailsPaneTitle,
          style: TextStyle(fontSize: 20, color: Colors.white),
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

  // Widget _buildTerminalSection() {
  //   return Expanded(
  //     child: Container(
  //       margin: const EdgeInsets.all(30.0),
  //       padding: const EdgeInsets.all(20),
  //       decoration: BoxDecoration(
  //         color: const Color.fromARGB(255, 29, 28, 28),
  //         borderRadius: BorderRadius.circular(12),
  //       ),
  //       // child: SingleChildScrollView(
  //       //   controller: _scrollController,
  //       //   child: TypingText(
  //       //     roles: [PortfolioConfig.introduction],
  //       //     style: const TextStyle(fontSize: 18, color: Colors.green),
  //       //     typingDelay: const Duration(milliseconds: 20),
  //       //     pauseOnComplete: const Duration(seconds: 1),
  //       //   ),
  //       // ),
  //     ),
  //   );
  // }
}
