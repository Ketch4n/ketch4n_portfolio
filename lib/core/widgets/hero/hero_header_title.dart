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
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(PortfolioConfig.greeting, style: AppTextStyles.heroTitle),

          Row(
            children: [
              Text(PortfolioConfig.a, style: AppTextStyles.heroTitle),
              TypingTextWidget(
                viewModel: titleVM,
                style: AppTextStyles.heroTitle.copyWith(color: Colors.cyan),
              ),
            ],
          ),

          Text(
            PortfolioConfig.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.heroSubTitle,
          ),

          // const SizedBox(height: 5),
          // HeroIconButtonWidget(),
        ],
      ),
    );
  }
}
