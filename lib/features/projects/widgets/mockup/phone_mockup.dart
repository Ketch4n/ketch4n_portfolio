import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ketch4n/features/projects/project_entity.dart';

class PhoneMockup extends StatefulWidget {
  const PhoneMockup({super.key, required this.projectDetails});

  final ProjectEntity projectDetails;

  @override
  State<PhoneMockup> createState() => _PhoneMockupState();
}

class _PhoneMockupState extends State<PhoneMockup> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _slideTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Auto-slide phone mockup every 2.5 s
    _slideTimer = Timer.periodic(const Duration(milliseconds: 2500), (_) {
      if (!mounted) return;
      final next = (_currentPage + 1) % widget.projectDetails.mockup.length;
      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
      setState(() => _currentPage = next);
    });
  }

  @override
  void dispose() {
    _slideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
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
              onPageChanged: (i) => setState(() => _currentPage = i),
              itemBuilder: (context, index) {
                return Image.asset(
                  widget.projectDetails.mockup[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(
                    color: Colors.black,
                    child: const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.white10,
                        size: 50,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        // Dot indicators
        Positioned(
          bottom: 18,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.projectDetails.mockup.length, (i) {
              final active = i == _currentPage;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: active ? 18 : 6,
                height: 6,
                decoration: BoxDecoration(
                  color: active ? Colors.white : Colors.white24,
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
