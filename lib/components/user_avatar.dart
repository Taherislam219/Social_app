import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double size;
  const UserAvatar({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        'assets/images/profile.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
