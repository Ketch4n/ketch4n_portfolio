import 'package:flutter/material.dart';

class WorkExperiencePage extends StatefulWidget {
  const WorkExperiencePage({super.key});

  @override
  State<WorkExperiencePage> createState() => _WorkExperiencePageState();
}

class _WorkExperiencePageState extends State<WorkExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      // decoration: BoxDecoration(
      //   color: Colors.white.withValues(alpha: 0.1),
      //   borderRadius: BorderRadius.circular(20),
      // ),
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.all(20),
    );
  }
}
