import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ketch4n/core/animations/beam_border.dart';
import 'package:ketch4n/core/theme/theme_provider.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart';
import 'package:ketch4n/core/widgets/ai_chat/ai_chat.dart';
import 'package:ketch4n/core/widgets/star/cosmic_bg.dart';
import 'package:ketch4n/features/home/home_page_vm.dart';
import 'package:ketch4n/features/projects/projects_page.dart';
import 'package:ketch4n/features/skills/skill_set_page.dart';
import 'package:ketch4n/features/work_experience/work_experience_page.dart';
import 'package:ketch4n/core/constants/app_constants.dart';
import 'package:ketch4n/features/about/about_page.dart';
import 'package:ketch4n/core/widgets/loading_screen.dart';
import 'package:ketch4n/core/widgets/navigation_rail.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeAsync = ref.watch(homeProvider);

    return homeAsync.when(
      loading: () => const LoadingScreen(),
      error: (_, _) => const LoadingScreen(),
      data: (loaded) {
        if (!loaded) return const LoadingScreen();
        return const _HomeContent();
      },
    );
  }
}

class _HomeContent extends ConsumerStatefulWidget {
  const _HomeContent();

  @override
  ConsumerState<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<_HomeContent> {
  final ScrollController ctrl = ScrollController();

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return CosmicBackground(
      child: Scaffold(
        backgroundColor: Theme.of(
          context,
        ).colorScheme.surface.withValues(alpha: 0.4),
        appBar: isMobile
            ? AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: NavigationRailWidget(),
                actions: [_buildThemeToggle(), const SizedBox(width: 10)],
              )
            : null,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                if (!isMobile)
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
                          SkillSetPage(),
                          ProjectsPage(),
                          SizedBox(height: 80),
                          WorkExperiencePage(),
                          SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Positioned(bottom: 0, right: 0, child: AiChatWidget()),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle() {
    return Consumer(
      builder: (context, ref, _) {
        final themeState = ref.watch(themeProvider);
        final isDark = themeState.isDarkMode;

        return Switch(
          value: isDark,
          onChanged: (value) =>
              ref.read(themeProvider.notifier).toggleTheme(value),
          thumbIcon: WidgetStateProperty.resolveWith<Icon?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.selected)) {
              return const Icon(Icons.dark_mode);
            }
            return const Icon(Icons.light_mode);
          }),
        );
      },
    );
  }
}
