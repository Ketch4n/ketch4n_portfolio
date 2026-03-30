import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism.dart';
import 'package:ketch4n/core/widgets/glassmorphism/glassmorphism_entity.dart';

class HeaderTitleBarWidget extends StatefulWidget {
  const HeaderTitleBarWidget({
    super.key,
    required this.child,
    this.width = double.infinity,
  });
  final String child;
  final double width;

  @override
  State<HeaderTitleBarWidget> createState() => _HeaderTitleBarWidgetState();
}

class _HeaderTitleBarWidgetState extends State<HeaderTitleBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GlassmorphismWidget(
      entity: GlassmorphismEntity(
        width: widget.width,
        height: 50,
        borderRadius: 10,
        firstColor: Colors.blue,
        child: Center(
          child: Text(
            widget.child,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
