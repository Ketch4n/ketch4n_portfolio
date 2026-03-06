import 'package:flutter/material.dart';
import 'package:ketch4n/features/contacts/contacts_page.dart';
import 'package:ketch4n/features/skills/skill_set_page.dart';
import 'package:ketch4n/features/work_experience/work_experience_page.dart';

class AsideSectionWidget extends StatefulWidget {
  const AsideSectionWidget({super.key});

  @override
  State<AsideSectionWidget> createState() => _AsideSectionWidgetState();
}

class _AsideSectionWidgetState extends State<AsideSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SkillSetPage(), WorkExperiencePage(), ContactsPage()],
    );
  }
}
