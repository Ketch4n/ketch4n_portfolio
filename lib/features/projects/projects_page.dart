import 'package:flutter/material.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
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
