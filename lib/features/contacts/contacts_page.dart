import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/beam.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/constants/size_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: SizeConstants.pageMaxWidth,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22),
            child: BeamAnimation(title: PortfolioConfig.contacts),
          ),
          GlassmorphismWidget(
            leftMargin: 0,
            rightMargin: 0,
            topMargin: 0,
            height: 240,
            width: double.infinity,
            firstColor: ColorConstants.previewColor,
            child: Column(children: [
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
