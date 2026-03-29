import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/electric_border.dart';

class HeroHeaderLeading extends StatelessWidget {
  const HeroHeaderLeading({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final String imagePath = isDark
        ? "assets/dev/gemini.png"
        : "assets/dev/gemini_light.png";

    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      alignment: Alignment.center,
      child: ElectricSplitBorder(
        // Ensure the border radius matches the ClipRRect below
        borderRadius: const Radius.circular(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 260,
            height: 380,
            // frameBuilder is called when the image is being loaded
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded || frame != null) {
                return child; // Image is loaded, show it
              }
              // Image is not loaded yet, show the Skeleton Loader
              return const SkeletonLoader(width: 260, height: 380);
            },
            // errorBuilder handles missing assets
            errorBuilder: (context, error, stackTrace) => Container(
              width: 260,
              height: 380,
              color: Colors.white10,
              child: const Icon(Icons.broken_image, color: Colors.white24),
            ),
          ),
        ),
      ),
    );
  }
}

// --- Skeleton Loader Widget ---

class SkeletonLoader extends StatefulWidget {
  final double width;
  final double height;

  const SkeletonLoader({super.key, required this.width, required this.height});

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmerController,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            // Linear gradient mimics a "sweep" of light
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.3, 0.5, 0.7],
              colors: [
                Colors.white.withValues(alpha: 0.05),
                Colors.white.withValues(alpha: 0.15),
                Colors.white.withValues(alpha: 0.05),
              ],
              transform: _SlidingGradientTransform(
                percent: _shimmerController.value,
              ),
            ),
          ),
        );
      },
    );
  }
}

// Helper to slide the shimmer gradient
class _SlidingGradientTransform extends GradientTransform {
  final double percent;
  const _SlidingGradientTransform({required this.percent});

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * (percent - 0.5) * 2, 0, 0);
  }
}
