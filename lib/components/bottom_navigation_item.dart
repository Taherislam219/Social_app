import 'package:first_app/pages/Main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationItem extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final Menu current;
  final Menu name;
  const BottomNavigationItem({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.current,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          current == name ? Colors.lightBlue : Colors.blueGrey,
          BlendMode.srcIn,
        ),
        height: 30,
        width: 20,
      ),
    );
  }
}
