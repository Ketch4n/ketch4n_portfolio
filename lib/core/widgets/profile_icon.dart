import 'package:flutter/material.dart';
import 'package:ketch4n/core/constants/app_constants.dart';

class ProfileIconWidget extends StatelessWidget {
  const ProfileIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue.withValues(alpha: 0.5), width: 5),
      ),
      child: ClipOval(
        child: Image.asset(
          AppConstants.profileImg,
          width: 200,
          height: 180,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
