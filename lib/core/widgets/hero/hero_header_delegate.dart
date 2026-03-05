import 'package:flutter/material.dart';
import 'package:ketch4n/core/widgets/hero/hero_header.dart';

class HeroHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double collapsedHeight;

  HeroHeaderDelegate({this.expandedHeight = 220, this.collapsedHeight = 100});

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => collapsedHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / (maxExtent - minExtent);

    /// scale from 1 → 0.7
    final scale = 1 - (progress * 0.3);

    return Container(
      color: Colors.transparent,
      child: Transform.scale(
        scale: scale,
        alignment: Alignment.centerLeft,
        child: const HeroHeaderWidget(),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant HeroHeaderDelegate oldDelegate) => true;
}
