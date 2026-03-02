import 'package:flutter/material.dart';
import 'package:ketch4n/core/animations/ripple_pulse_effect.dart';
import 'package:ketch4n/core/constants/home_constants.dart';
import 'package:ketch4n/core/theme/app_text_style.dart';
import 'package:ketch4n/core/widgets/hero/hero_icon_button.dart';
import 'package:ketch4n/core/widgets/hero/profile_icon.dart';
import 'package:ketch4n/core/widgets/typing_text/typing_text.dart';
import 'package:ketch4n/core/widgets/typing_text/typing_text_vm.dart';

class HeroHeaderWidget extends StatefulWidget {
  const HeroHeaderWidget({super.key});

  @override
  State<HeroHeaderWidget> createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroHeaderWidget> {
  final titleVM = TypingTextVM(
    texts: PortfolioConfig.roles,
    typingSpeed: const Duration(milliseconds: 50),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      child: Row(children: [_buildProfile(), _buildTextSection()]),
    );
  }

  Widget _buildProfile() {
    return Stack(
      children: [
        ProfileIconWidget(),
        Positioned(
          right: 30,
          top: 20,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PulseAnimation(),
              const Icon(Icons.circle, color: Colors.green, size: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextSection() {
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

          const SizedBox(height: 5),
          HeroIconButtonWidget(),
        ],
      ),
    );
  }
}
