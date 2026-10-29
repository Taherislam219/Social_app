import 'package:first_app/styles/app_text.dart' show AppText;
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final String user;
  const PostItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Text(user, style: AppText.subtitle3),
              ],
            ),
          ),
          Image.asset('assets/images/waterfall.jpg', width: double.infinity),
          Align(
            alignment: Alignment.centerLeft,
            child: Text('The Haven WaterFall', style: AppText.subtitle3),
          ),
        ],
      ),
    );
  }
}
