import 'package:flutter/material.dart';

class GlassmorphismEntity {
  final double width;
  final double height;

  final double borderRadius;
  final double blur;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;
  final Color firstColor;
  final Color secondColor;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final Widget child;

  GlassmorphismEntity({
    required this.width,
    this.height = 0,

    this.borderRadius = 20,
    this.blur = 20,
    this.leftMargin = 20,
    this.rightMargin = 20,
    this.topMargin = 20,
    this.bottomMargin = 20,
    this.firstColor = Colors.white,
    this.secondColor = Colors.white,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    required this.child,
  });
}
