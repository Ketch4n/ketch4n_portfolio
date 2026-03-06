import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';
import 'package:ketch4n/core/widgets/header_title_bar.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return GlassmorphismWidget(
      height: 240,
      width: double.infinity,
      firstColor: ColorConstants.previewColor,
      child: Column(
        children: [HeaderTitleBarWidget(child: PortfolioConfig.contacts)],
      ),
    );
  }
}
