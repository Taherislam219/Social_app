import 'dart:ui';

import 'package:first_app/components/post_item.dart';
import 'package:first_app/config/app_icons.dart';
import 'package:first_app/config/app_roots.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  List<String> users = [];
  @override
  Widget build(BuildContext context) {
    mockUsersFromServer();
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topLeft,
          child: const Text(
            'Welcome ',
            style: TextStyle(
              color: Color.fromARGB(255, 6, 59, 150),
              fontSize: 30,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.nearby);
            },
            icon: SvgPicture.asset(
              AppIcons.icLocation,
              width: 30,
              height: 30,
              colorFilter: const ColorFilter.mode(
                Color(0xFF063B96),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
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
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostItem(user: users[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 24);
        },
        itemCount: users.length,
      ),
    );
  }

  void mockUsersFromServer() {
    for (var i = 0; i < 100; i++) {
      users.add('User number $i');
    }
  }
}
