import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/skeleton/skeleton_shimmer.dart';

/// An [Image.asset] wrapper that shows a shimmer skeleton while the image is
/// still decoding, fades the image in once ready, and renders a graceful
/// fallback on error.
///
/// Even though the images are bundled assets, decoding large screenshots can
/// leave a visible blank frame on first display. The shimmer covers that gap.
class SkeletonImage extends StatelessWidget {
  const SkeletonImage({
    super.key,
    required this.assetPath,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.errorWidget,
    this.borderRadius,
  });

  final String assetPath;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      assetPath,
      fit: fit,
      width: width,
      height: height,
      // Keeps the previously decoded frame in the image cache so re-displaying
      // the same asset (e.g. paging back to it) is instant.
      gaplessPlayback: true,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;

        final bool isReady = frame != null;
        // Keep a stable tree: the image and the shimmer overlay always exist,
        // we only fade the shimmer out once the first frame is ready. This
        // avoids swapping subtrees under the pointer (which can trip the
        // mouse tracker on web/desktop).
        return Stack(
          fit: StackFit.passthrough,
          children: [
            AnimatedOpacity(
              opacity: isReady ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 350),
              child: child,
            ),
            Positioned.fill(
              child: IgnorePointer(
                child: AnimatedOpacity(
                  opacity: isReady ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 350),
                  child: const SkeletonShimmer(),
                ),
              ),
            ),
          ],
        );
      },
      errorBuilder: (_, _, _) => errorWidget ?? _defaultError(),
    );

    if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }
    return image;
  }

  Widget _defaultError() {
    return Container(
      color: const Color(0xFF111111),
      child: const Center(
        child: Icon(Icons.image_not_supported, color: Colors.white10, size: 40),
      ),
    );
  }
}
