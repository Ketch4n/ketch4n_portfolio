import 'package:flutter/material.dart';
import 'package:ketch4n/features/home/home_page_vm.dart';
import 'package:provider/provider.dart'; // Standard for MVVM
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/core/widgets/hero/hero_header.dart';
import 'package:ketch4n/core/widgets/loading_screen.dart';
import 'package:ketch4n/core/widgets/navigation_rail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // We wrap this page with the ViewModel provider
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const LoadingScreen();
          }

          return _HomeContent();
        },
      ),
    );
  }
}

class _HomeContent extends StatefulWidget {
  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  final ScrollController ctrl = ScrollController();

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppConstants.bgUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Row(
          children: [
            const NavigationRailWidget(),
            Expanded(
              child: Scrollbar(
                controller: ctrl,
                interactive: true,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: ctrl,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: const Column(
                    children: [
                      HeroHeaderWidget(),
                      // ProjectsPage(),
                      // WorkExperiencePage(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
