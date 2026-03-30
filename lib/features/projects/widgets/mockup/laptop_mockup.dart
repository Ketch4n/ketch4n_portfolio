import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ketch4n/features/projects/project_model.dart';

class LaptopMockup extends StatefulWidget {
  const LaptopMockup({super.key, required this.projectDetails});

  final ProjectModel projectDetails;

  @override
  State<LaptopMockup> createState() => _LaptopMockupState();
}

class _LaptopMockupState extends State<LaptopMockup> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _slideTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

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
    const laptopW = 480.0;
    const screenH = 220.0; // reduced from 280
    const bezelH = 12.0; // reduced from 24
    const chinH = 16.0; // reduced from 32
    const baseH = 10.0; // reduced from 18
    // const standH = 8.0; // reduced from 10

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Lid ────────────────────────────────────────────────────────────
        Container(
          width: laptopW,
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            border: Border.all(color: Colors.white10, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withValues(alpha: 0.18),
                blurRadius: 60,
                spreadRadius: 8,
              ),
            ],
          ),
          child: Column(
            children: [
              // Top bezel
              SizedBox(height: bezelH),

              // Screen area
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                    height: screenH,
                    child: Stack(
                      children: [
                        // Sliding screenshots
                        PageView.builder(
                          controller: _pageController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: widget.projectDetails.mockup.length,
                          onPageChanged: (i) =>
                              setState(() => _currentPage = i),
                          itemBuilder: (context, index) {
                            return Image.asset(
                              widget.projectDetails.mockup[index],
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) => Container(
                                color: const Color(0xFF111111),
                                child: const Center(
                                  child: Icon(
                                    Icons.image_not_supported,
                                    color: Colors.white10,
                                    size: 40,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        // Dot indicators — bottom-center of screen
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              widget.projectDetails.mockup.length,
                              (i) {
                                final active = i == _currentPage;
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  width: active ? 18 : 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: active
                                        ? Colors.white
                                        : Colors.white24,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Bottom chin + camera dot
              SizedBox(height: chinH),
            ],
          ),
        ),

        // ── Hinge bar ──────────────────────────────────────────────────────
        Container(
          width: laptopW + 16,
          height: baseH,
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
            border: const Border(
              left: BorderSide(color: Colors.white10, width: 1),
              right: BorderSide(color: Colors.white10, width: 1),
              bottom: BorderSide(color: Colors.white10, width: 1),
            ),
          ),
        ),

        // ── Stand / base ───────────────────────────────────────────────────
        // ClipPath(
        //   clipper: TrapezoidClipper(),
        //   child: Container(
        //     width: laptopW * 0.55,
        //     height: standH,
        //     color: const Color(0xFF222222),
        //   ),
        // ),

        // ── Feet line ──────────────────────────────────────────────────────
        Container(
          width: laptopW * 0.7,
          height: 3,
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
