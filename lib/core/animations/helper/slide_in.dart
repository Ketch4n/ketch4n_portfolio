// import 'package:flutter/material.dart';

// class SlideInCard extends StatelessWidget {
//   final Widget child;
//   final int delay; // Delay in milliseconds

//   const SlideInCard({super.key, required this.child, required this.delay});

//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder<double>(
//       // We animate from 0.0 to 1.0
//       tween: Tween(begin: 0.0, end: 1.0),
//       curve: Curves.easeOutCubic,
//       duration: const Duration(milliseconds: 600),
//       // Use the delay to stagger the start time
//       builder: (context, value, child) {
//         return Padding(
//           padding: EdgeInsets.only(top: 10), // Space between cards
//           child: Opacity(
//             opacity: value,
//             child: Transform.translate(
//               // Move from -50px (left) to 0px
//               offset: Offset(-50 * (1 - value), 0),
//               child: child,
//             ),
//           ),
//         );
//       },
//       child: child,
//     );
//   }
// }
