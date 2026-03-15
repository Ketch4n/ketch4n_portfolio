import 'package:flutter/material.dart';

class ProfileIconWidget extends StatefulWidget {
  final String image;
  const ProfileIconWidget({super.key, required this.image});

  @override
  State<ProfileIconWidget> createState() => _ProfileIconWidgetState();
}

class _ProfileIconWidgetState extends State<ProfileIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue.withValues(alpha: 0.5), width: 5),
      ),
      child: ClipOval(
        child: Image.asset(
          widget.image,
          width: 170,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
