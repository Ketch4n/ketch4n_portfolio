// import 'package:flutter/material.dart';

// class StaggeredSlideCard extends StatelessWidget {
//   final Widget child;
//   final Duration delay;

//   const StaggeredSlideCard({super.key, required this.child, required this.delay});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Future.delayed(delay),
//       builder: (context, snapshot) {
//         return TweenAnimationBuilder<double>(
//           // If the delay hasn't passed, keep it at 0.0
//           tween: Tween(
//             begin: 0.0,
//             end: snapshot.connectionState == ConnectionState.done ? 1.0 : 0.0,
//           ),
//           curve: Curves.easeOutQuart,
//           duration: const Duration(milliseconds: 500),
//           builder: (context, value, child) {
//             return Opacity(
//               opacity: value,
//               child: Transform.translate(
//                 // Slides from -30.0 to 0.0
//                 offset: Offset(-30 * (1 - value), 0),
//                 child: child,
//               ),
//             );
//           },
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 16),
//             child: child,
//           ),
//         );
//       },
//     );
//   }
// }
