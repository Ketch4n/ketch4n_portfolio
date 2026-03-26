import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam_border.dart';
import 'package:ketch4n/core/theme/theme_provider.dart';
import 'package:ketch4n/features/contacts/contacts_page.dart';
import 'package:ketch4n/features/home/home_page_vm.dart';
import 'package:ketch4n/features/projects/projects_page.dart';
import 'package:ketch4n/features/skills/skill_set_page.dart';
import 'package:ketch4n/features/work_experience/work_experience_page.dart';
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            Row(
              // crossAxisAlignment: .center,
              mainAxisAlignment: .spaceEvenly,

              children: [
                BeamBorderAnimation(
                  child: Image.asset(
                    AppConstants.flutterLogo,
                    height: 40,
                    width: 40,
                  ),
                ),
                NavigationRailWidget(),
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          themeProvider.isDarkMode
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        Switch(
                          value: themeProvider.isDarkMode,
                          onChanged: (value) {
                            themeProvider.toggleTheme(value);
                          },
                          // Customizing the switch look
                          activeTrackColor: Colors.deepPurpleAccent.withValues(
                            alpha: 0.5,
                          ),
                          activeThumbColor: Colors.deepPurpleAccent,
                        ),
                        SizedBox(width: 30),
                      ],
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: Scrollbar(
                controller: ctrl,
                interactive: true,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: ctrl,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    spacing: 50,
                    children: [
                      HeroHeaderWidget(),
                      SkillSetPage(),
                      ProjectsPage(),
                      WorkExperiencePage(),
                      ContactsPage(),
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
