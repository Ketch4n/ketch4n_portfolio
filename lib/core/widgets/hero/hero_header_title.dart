import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/theme/app_text_style.dart';
import 'package:ketch4n/core/widgets/typing_text/typing_text.dart';
import 'package:ketch4n/core/widgets/typing_text/typing_text_vm.dart';

class HeroHeaderTitle extends StatefulWidget {
  const HeroHeaderTitle({super.key});

  @override
  State<HeroHeaderTitle> createState() => _HeroHeaderTitleState();
}

class _HeroHeaderTitleState extends State<HeroHeaderTitle> {
  final titleVM = TypingTextVM(
    texts: PortfolioConfig.roles,
    typingSpeed: const Duration(milliseconds: 50),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(PortfolioConfig.greeting, style: AppTextStyles.heroTitle(context)),

        Row(
          children: [
            Text(PortfolioConfig.a, style: AppTextStyles.heroTitle(context)),
            TypingTextWidget(
              viewModel: titleVM,
              style: AppTextStyles.heroTitle(
                context,
              ).copyWith(color: Colors.blue),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          PortfolioConfig.description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.heroSubTitle(context),
        ),

        // const SizedBox(height: 5),
        // HeroIconButtonWidget(),
      ],
    );
  }
}
