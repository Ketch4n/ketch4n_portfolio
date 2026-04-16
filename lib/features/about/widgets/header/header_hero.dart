import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/theme/app_text_style.dart';
import 'package:ketch4n/core/utils/screen_breakpoints.dart';
import 'package:ketch4n/core/widgets/typing_text/typing_text.dart';
import 'package:ketch4n/core/widgets/typing_text/typing_text_vm.dart';

class HeaderHeroWidget extends StatefulWidget {
  const HeaderHeroWidget({super.key});

  @override
  State<HeaderHeroWidget> createState() => _HeaderHeroWidgetState();
}

class _HeaderHeroWidgetState extends State<HeaderHeroWidget> {
  final titleVM = TypingTextVM(
    texts: PortfolioConfig.roles,
    typingSpeed: const Duration(milliseconds: 50),
  );
  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isMobile ? .center : CrossAxisAlignment.start,

      children: [
        Text(PortfolioConfig.greeting, style: AppTextStyles.heroTitle(context)),

        Row(
          crossAxisAlignment: .start,
          mainAxisAlignment: isMobile ? .center : .start,
          children: [
            Text(PortfolioConfig.a, style: AppTextStyles.heroTitle(context)),
            Flexible(
              child: TypingTextWidget(
                viewModel: titleVM,
                style: AppTextStyles.heroTitle(
                  context,
                ).copyWith(color: Colors.blue),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          PortfolioConfig.description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.heroSubTitle(context),
          textAlign: isMobile ? .center : .start,
        ),

        // const SizedBox(height: 5),
        // HeroIconButtonWidget(),
      ],
    );
  }
}
