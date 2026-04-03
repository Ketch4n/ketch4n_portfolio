import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/slide_direction.dart';
import 'package:ketch4n/features/projects/project_entity.dart';

class PhoneMockup extends StatefulWidget {
  const PhoneMockup({super.key, required this.projectDetails});

  final ProjectEntity projectDetails;

  @override
  State<PhoneMockup> createState() => _PhoneMockupState();
}

class _PhoneMockupState extends State<PhoneMockup> {
  late final PageController _pageController;
  late final ValueNotifier<int> _currentPage; // State Management
  Timer? _slideTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPage = ValueNotifier<int>(0);

    _startAutoSlide();
  }

  void _startAutoSlide() {
    _slideTimer = Timer.periodic(const Duration(milliseconds: 2500), (_) {
      final next =
          (_currentPage.value + 1) % widget.projectDetails.mockup.length;

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
      // Updating ValueNotifier instead of setState
      _currentPage.value = next;
    });
  }

  @override
  void dispose() {
    _slideTimer?.cancel();
    _pageController.dispose();
    _currentPage.dispose(); // Clean up notifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SlideInTransition stays at the top, but it won't rebuild
    // when the page changes because we aren't using setState.
    return SlideInTransition(
      direction: SlideDirection.bottomToTop,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [_buildPhoneFrame(), _buildDotIndicators()],
      ),
    );
  }

  Widget _buildPhoneFrame() {
    return Container(
      width: 280,
      height: 590,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(48),
        border: Border.all(color: Colors.white10, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withValues(alpha: 0.2),
            blurRadius: 60,
            spreadRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: PageView.builder(
          controller: _pageController,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.projectDetails.mockup.length,
          onPageChanged: (i) => _currentPage.value = i,
          itemBuilder: (context, index) {
            return Image.asset(
              widget.projectDetails.mockup[index],
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => _buildErrorWidget(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDotIndicators() {
    return Positioned(
      bottom: 20,
      // ValueListenableBuilder only rebuilds this specific part of the UI
      child: ValueListenableBuilder<int>(
        valueListenable: _currentPage,
        builder: (context, activeIndex, _) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.projectDetails.mockup.length, (i) {
              final isActive = i == activeIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: isActive ? 18 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.white24,
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Icon(Icons.image_not_supported, color: Colors.white10, size: 50),
      ),
    );
  }
}
