import 'package:flutter/material.dart';

class BeamBorderPainter extends CustomPainter {
  final Animation<double> animationValue;
  final Color color;

  BeamBorderPainter({required this.animationValue, required this.color})
    : super(repaint: animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final RRect rrect = RRect.fromRectAndRadius(rect, const Radius.circular(5));

    // 1. Create the path of the border
    final Path path = Path()..addRRect(rrect);

    // 2. Use PathMetrics to extract a specific segment of the path
    final metrics = path.computeMetrics().first;
    final double totalLength = metrics.length;

    // The beam length (e.g., 20% of the total perimeter)
    double beamLength = totalLength * 0.8;
    double start = totalLength * animationValue.value;
    double end = start + beamLength;

    // 3. Define the paint for the beam (with glow)
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 2);

    // 4. Draw the segment (handling the wrap-around at the end of the path)
    if (end > totalLength) {
      canvas.drawPath(metrics.extractPath(start, totalLength), paint);
      canvas.drawPath(metrics.extractPath(0, end - totalLength), paint);
    } else {
      canvas.drawPath(metrics.extractPath(start, end), paint);
    }
  }

  @override
  bool shouldRepaint(covariant BeamBorderPainter oldDelegate) => true;
}
