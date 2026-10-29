import 'dart:ui';

import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const Toolbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Color.fromARGB(255, 6, 59, 150), fontSize: 30),
      ),
      centerTitle: false,
      actions: actions,
      backgroundColor: Colors.white.withValues(alpha: 0.55),
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.55),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.4),
                width: 1,
              ),
            ),
          ),
        ),
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
