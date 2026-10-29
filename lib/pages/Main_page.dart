import 'dart:ui';

import 'package:first_app/components/bottom_navigation_item.dart';
import 'package:first_app/config/app_icons.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/profile_page.dart';
import 'package:first_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  Menu currentIndex = Menu.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[currentIndex.index],
      bottomNavigationBar: MyBottomNavigation(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }

  final _pages = [
    HomePage(),
    Center(child: Text('Favorite')),
    Center(child: Text('Add post')),
    Center(child: Text('Message')),
    ProfilePage(),
  ];
}

enum Menu { home, favorite, add, message, user }

class MyBottomNavigation extends StatelessWidget {
  final Menu currentIndex;
  final ValueChanged<Menu> onTap;
  const MyBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      height: 87,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Glassy white rounded bar
          Positioned(
            left: 0,
            right: 0,
            top: 17,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: BottomNavigationItem(
                          onPressed: () => onTap(Menu.home),
                          icon: AppIcons.icHome,
                          current: currentIndex,
                          name: Menu.home,
                        ),
                      ),
                      Expanded(
                        child: BottomNavigationItem(
                          onPressed: () => onTap(Menu.favorite),
                          icon: AppIcons.icFavorite,
                          current: currentIndex,
                          name: Menu.favorite,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: BottomNavigationItem(
                          onPressed: () => onTap(Menu.message),
                          icon: AppIcons.icMessage,
                          current: currentIndex,
                          name: Menu.message,
                        ),
                      ),
                      Expanded(
                        child: BottomNavigationItem(
                          onPressed: () => onTap(Menu.user),
                          icon: AppIcons.icUser,
                          current: currentIndex,
                          name: Menu.user,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Inner yellow circle
          Positioned(
            top: -5,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => onTap(Menu.add),
                child: Container(
                  padding: EdgeInsets.all(16),
                  height: 64,
                  width: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: SvgPicture.asset(AppIcons.icAdd),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
