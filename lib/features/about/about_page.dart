import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/color_constants.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/theme/app_text_style.dart';
import 'package:ketch4n/core/widgets/glassmorphism.dart';
import 'package:ketch4n/core/widgets/header_title_bar.dart';
import 'package:ketch4n/core/widgets/text_tag/text_tag.dart';

class AboutPageWidget extends StatefulWidget {
  const AboutPageWidget({super.key});

  @override
  State<AboutPageWidget> createState() => _AboutPageWidgetState();
}

class _AboutPageWidgetState extends State<AboutPageWidget> {
  final int startYear = 2022;
  int get totalYears => DateTime.now().year - startYear;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Container(
        //   height: 180,
        //   width: 200,
        //   // margin: const EdgeInsets.only(top: 10),
        //   // padding: const EdgeInsets.all(10),
        //   child: SizedBox(),
        // ),
        Expanded(
          child: GlassmorphismWidget(
            firstColor: ColorConstants.previewColor,
            leftMargin: 20,
            width: double.maxFinite,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Align(
                      alignment: .centerLeft,
                      child: HeaderTitleBarWidget(
                        child: PortfolioConfig.aboutMe,
                        width: 250,
                      ),
                    ),
                    TextTagWidget(
                      text: totalYears.toString() + PortfolioConfig.yrsExp,
                    ),
                    SizedBox(width: 10),
                    TextTagWidget(text: PortfolioConfig.role),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5,
                  ),
                  child: Text(
                    PortfolioConfig.description + PortfolioConfig.introduction,
                    style: AppTextStyles.heroSubTitle,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
