import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';

class SkillSetPage extends StatelessWidget {
  const SkillSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphismWidget(
      firstColor: ColorConstants.previewColor,
      width: double.maxFinite,
      height: 130,
      child: Center(
        child: Row(
          mainAxisAlignment: .center,

          children: [
            FaIcon(FontAwesomeIcons.bullseye),
            FaIcon(FontAwesomeIcons.circleNodes),
            FaIcon(FontAwesomeIcons.atom),
          ],
        ),
      ),
    );
  }
}
