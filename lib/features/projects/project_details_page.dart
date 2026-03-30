import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/features/projects/project_entity.dart';
import 'package:ketch4n/features/projects/widgets/mockup/laptop_mockup.dart';
import 'package:ketch4n/features/projects/widgets/mockup/phone_mockup.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({super.key, required this.projectDetails});

  final ProjectEntity projectDetails;

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  // Tech stack carousel scroll
  late final ScrollController _carouselController;
  Timer? _carouselTimer;
  double _carouselOffset = 0;

  @override
  void initState() {
    super.initState();

    _carouselController = ScrollController();

    // Continuously scroll the tech carousel
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startCarouselScroll();
    });
  }

  void _startCarouselScroll() {
    _carouselTimer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      if (!mounted) return;
      if (!_carouselController.hasClients) return;
      final position = _carouselController.position;
      // Wait until the ListView has been fully laid out
      if (!position.hasContentDimensions) return;
      final maxScroll = position.maxScrollExtent;
      if (maxScroll <= 0) return;
      _carouselOffset += 1.2;
      if (_carouselOffset >= maxScroll) _carouselOffset = 0;
      _carouselController.jumpTo(_carouselOffset);
    });
  }

  @override
  void dispose() {
    _carouselTimer?.cancel();
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Scaffold(
      backgroundColor: ColorConstants.previewColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 30,
                  ),
                  child: isMobile
                      ? Column(
                          children: _buildLayoutContent(
                            context,
                            true,
                            widget.projectDetails.type,
                          ),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _buildLayoutContent(
                            context,
                            false,
                            widget.projectDetails.type,
                          ),
                        ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white70, size: 20),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildLayoutContent(
    BuildContext context,
    bool isMobile,
    int projectType,
  ) {
    // Whether tech stack should move below the mockup (laptop layout, desktop only)
    // final techStackBelowMockup = projectType == 1 && !isMobile;

    final leftColumn = Expanded(
      flex: isMobile
          ? 0
          : projectType == 1
          ? 1
          : 2,
      child: Column(
        spacing: 20,
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 5),
          Row(
            spacing: 20,
            children: [
              _buildAppIcon(widget.projectDetails.iconPath),
              Text(
                widget.projectDetails.appName,
                textAlign: isMobile ? TextAlign.center : TextAlign.start,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            widget.projectDetails.longName,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          // const ButtonHeaderWidget(),

          // _buildGlassCard(
          //   title: "Description",
          //   child: Text(
          //     widget.projectDetails.description,
          //     style: TextStyle(
          //       color: Colors.white70,
          //       fontSize: 17,
          //       height: 1.6,
          //     ),
          //   ),
          //   context: context,
          // ),
          // _buildGlassCard(
          //   title: "Use Case",
          //   child: Text(
          //     widget.projectDetails.useCase,
          //     style: TextStyle(
          //       color: Colors.white70,
          //       fontSize: 15,
          //       height: 1.6,
          //     ),
          //   ),
          //   context: context,
          // ),

          // ── Tech Stack Carousel (only here when NOT laptop desktop layout)
          // if (!techStackBelowMockup)
          //   _buildGlassCard(
          //     title: "Tech Stack",
          //     child: _buildTechCarousel(context),
          //     context: context,
          //   ),
        ],
      ),
    );

    // RIGHT COLUMN: Phone or Laptop mockup depending on projectType
    final rightColumn = Expanded(
      flex: isMobile ? 0 : 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: widget.projectDetails.type == 1
                ? LaptopMockup(projectDetails: widget.projectDetails)
                : PhoneMockup(projectDetails: widget.projectDetails),
          ),

          // ── Tech Stack Carousel below laptop mockup (desktop + laptop only)
          // if (techStackBelowMockup) ...[
          //   const SizedBox(height: 24),
          //   GlassCardWidget(title: "Tech Stack", subtitle: "Tech Stack"),
          // ],
        ],
      ),
    );

    if (isMobile) {
      return [
        leftColumn,
        const SizedBox(height: 20),
        // On mobile, tech stack is already in the left column (techStackBelowMockup is false),
        // so just show the mockup here.
        Center(
          child: widget.projectDetails.type == 1
              ? LaptopMockup(projectDetails: widget.projectDetails)
              : PhoneMockup(projectDetails: widget.projectDetails),
        ),
      ];
    }

    return [leftColumn, const SizedBox(width: 20), rightColumn];
  }

  // ── Tech Stack Carousel ────────────────────────────────────────────────────

  // Widget _buildTechCarousel(BuildContext context) {
  //   // Duplicate list so seamless loop feels natural
  //   final doubled = [
  //     ...widget.projectDetails.techStack,
  //     // ...widget.projectDetails.techStack,
  //     // ...widget.projectDetails.techStack,
  //   ];

  //   return SizedBox(
  //     height: 80,
  //     child: ListView.separated(
  //       controller: _carouselController,
  //       scrollDirection: Axis.horizontal,
  //       physics: const NeverScrollableScrollPhysics(),
  //       itemCount: doubled.length,
  //       separatorBuilder: (_, _) => const SizedBox(width: 10),
  //       itemBuilder: (context, index) {
  //         final item = doubled[index % widget.projectDetails.techStack.length];
  //         return SkillIconWidget(assetPath: item.icon, text: item.title);
  //       },
  //     ),
  //   );
  // }

  Widget _buildAppIcon(String imgPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(imgPath, width: 40, height: 40, fit: BoxFit.cover),
    );
  }

  // Widget _buildGlassCard({
  //   required String title,
  //   required Widget child,
  //   required BuildContext context,
  // }) {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(24),
  //     child: BackdropFilter(
  //       filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
  //       child: Container(
  //         width: double.infinity,
  //         padding: const EdgeInsets.all(24),
  //         decoration: BoxDecoration(
  //           color: Colors.white.withValues(alpha: 0.03),
  //           borderRadius: BorderRadius.circular(24),
  //           border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               title.toUpperCase(),
  //               style: TextStyle(
  //                 color: Theme.of(context).colorScheme.primary,
  //                 fontWeight: FontWeight.w900,
  //                 fontSize: 12,
  //                 letterSpacing: 1.5,
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //             child,
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
