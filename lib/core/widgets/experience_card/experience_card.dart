import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';

class ExperienceCardWidget extends StatefulWidget {
  final String leading;
  final String title;
  final String subtitle;
  final String year;
  final List<String> techSkillTag;
  const ExperienceCardWidget({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.year,
    required this.techSkillTag,
  });

  @override
  State<ExperienceCardWidget> createState() => _ExperienceCardWidgetState();
}

class _ExperienceCardWidgetState extends State<ExperienceCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GlassmorphismWidget(
      height: 140,
      width: double.infinity,
      firstColor: ColorConstants.previewColor,
      child: Column(
        children: [
          ListTile(
            textColor: Colors.white,
            leading: Container(
              decoration: BoxDecoration(
                shape: .circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: ClipOval(
                child: Image.asset(widget.leading, fit: BoxFit.cover),
              ),
            ),
            title: Text(widget.title),
            subtitle: Text("${widget.subtitle}\n${widget.year}"),
          ),

          Expanded(
            child: Align(
              alignment: .bottomCenter,
              child: Wrap(
                direction: .horizontal,
                // runSpacing: 10,
                spacing: 10,
                children: widget.techSkillTag
                    .map((skill) => TextTagWidget(text: skill))
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
