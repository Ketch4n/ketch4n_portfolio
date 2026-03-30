import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';

class GlassCardWidget extends StatefulWidget {
  final String? leading;
  final String title;
  final String? subtitle;
  final String? year;
  final List<String>? techSkillTag;
  const GlassCardWidget({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.year,
    this.techSkillTag,
  });

  @override
  State<GlassCardWidget> createState() => _GlassCardWidgetState();
}

class _GlassCardWidgetState extends State<GlassCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GlassmorphismWidget(
      leftMargin: 0,
      rightMargin: 0,
      height: 240,
      width: double.infinity,
      firstColor: ColorConstants.previewColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  shape: .circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(widget.leading!, fit: BoxFit.cover),
                ),
              ),
              title: Text(widget.title),
              subtitle: Text(widget.subtitle!),
              trailing: Text(widget.year!, style: TextStyle(fontSize: 15)),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: .bottomStart,
                  child: Wrap(
                    direction: .horizontal,
                    runSpacing: 10,
                    spacing: 10,
                    children: widget.techSkillTag!
                        .map((skill) => TextTagWidget(text: skill))
                        .toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
