import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam_border.dart';
import 'package:ketch4n/core/theme/theme_provider.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart';
import 'package:ketch4n/core/widgets/star/cosmic_bg.dart';
import 'package:ketch4n/features/contacts/contacts_page.dart';
import 'package:ketch4n/features/home/home_page_vm.dart';
import 'package:ketch4n/features/projects/projects_page.dart';
import 'package:ketch4n/features/skills/skill_set_page.dart';
import 'package:ketch4n/features/work_experience/work_experience_page.dart';
import 'package:provider/provider.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/features/about/about_page.dart';
import 'package:ketch4n/core/widgets/loading_screen.dart';
import 'package:ketch4n/core/widgets/navigation_rail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const LoadingScreen();
          }
          return const _HomeContent();
        },
      ),
    );
  }
}

class _HomeContent extends StatefulWidget {
  const _HomeContent();

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
    // Breakpoint check
    final bool isDesktop = Responsive.isDesktop(context);

    return CosmicBackground(
      child: Scaffold(
        // The Scaffold background is set to a slight transparent surface to let the BG image peek through
        backgroundColor: Theme.of(
          context,
        ).colorScheme.surface.withValues(alpha: 0.4),

        // 1. Mobile/Tablet: Show AppBar with Hamburger Menu
        appBar: !isDesktop
            ? AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Image.asset(AppConstants.flutterLogo, height: 30),
                actions: [_buildThemeToggle(), const SizedBox(width: 10)],
              )
            : null,

        // 2. Mobile/Tablet: Show Drawer (Hamburger content)
        drawer: !isDesktop
            ? Drawer(
                width: 300,
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: const SafeArea(
                  child:
                      NavigationRailWidget(), // NavigationRailWidget handles its own Row/Column flip
                ),
              )
            : null,

        body: Column(
          children: [
            // 3. Desktop: Show Custom Header Row
            if (isDesktop)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 40,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BeamBorderAnimation(
                      child: Image.asset(
                        AppConstants.flutterLogo,
                        height: 40,
                        width: 40,
                      ),
                    ),
                    const NavigationRailWidget(),
                    _buildThemeToggle(),
                  ],
                ),
              ),

            // 4. Main Scrollable Content
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
                      AboutPage(),
                      // SizedBox(height: 80),
                      SkillSetPage(),
                      // SizedBox(height: 100),
                      ProjectsPage(),
                      SizedBox(height: 80),
                      WorkExperiencePage(),
                      // SizedBox(height: 100),
                      ContactsPage(),
                      SizedBox(height: 100),
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

  /// Extracted Theme Toggle Widget
  Widget _buildThemeToggle() {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 4),
            Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) => themeProvider.toggleTheme(value),
              // activeTrackColor: Colors.deepPurpleAccent.withValues(alpha: 0.5),
              // activeThumbColor: Colors.deepPurpleAccent,
            ),
          ],
        );
      },
    );
  }
}
