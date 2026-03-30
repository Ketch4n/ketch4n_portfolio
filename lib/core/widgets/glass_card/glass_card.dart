import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/widgets/glass_card/glass_card_entity.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';

class GlassCardWidget extends StatefulWidget {
  final GlassCardEntity cardEntity;
  const GlassCardWidget({super.key, required this.cardEntity});

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
                  child: Image.asset(
                    widget.cardEntity.leading!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(widget.cardEntity.title),
              subtitle: Text(widget.cardEntity.subtitle!),
              trailing: Text(
                widget.cardEntity.trailing!,
                style: TextStyle(fontSize: 15),
              ),
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
                    children: widget.cardEntity.techSkillTag!
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
