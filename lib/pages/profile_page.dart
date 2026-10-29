import 'dart:ui';

import 'package:first_app/components/toolbar.dart';
import 'package:first_app/config/app_icons.dart';
import 'package:first_app/config/app_roots.dart';
import 'package:first_app/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: 'Profile',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  BlurDialogRoute(
                    builder: (dialogContext) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.3),
                              ),
                            ),
                            child: AlertDialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              surfaceTintColor: Colors.transparent,
                              title: Text('Confirm Logout'),
                              content: Text(
                                'Are you sure you want to log out?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(dialogContext).pop();
                                  },
                                  child: Text('No'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed(AppRoutes.login);
                                  },
                                  child: Text('Yes'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              icon: SvgPicture.asset(
                AppIcons.iclongout,
                colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 6, 59, 150),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            border: Border.all(color: Colors.blueGrey),
          ),
          child: ClipRRect(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/cover.jpg'),
                            fit: BoxFit.cover,
                          ),
                          border: const Border(
                            bottom: BorderSide(color: Colors.white, width: 6),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -50,
                        child: Container(
                          width: 110,
                          height: 110,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.25),
                                blurRadius: 12,
                                spreadRadius: 1,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/profile.jpg',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  const Text(
                    'User_Name',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const Text(
                    '@User · Flutter Developer',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            '12',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text('Posts'),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            '250',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text('Followers'),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            '180',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text('Following'),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        // Narrow screen
                        if (constraints.maxWidth < 350) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.editProfile);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(0, 50),
                                ),
                                child: const Text('Edit Profile'),
                              ),
                              const SizedBox(height: 10),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(0, 50),
                                ),
                                child: const Text('Share Profile'),
                              ),
                            ],
                          );
                        }

                        // Normal and wide screens
                        return Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.editProfile);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(0, 50),
                                ),
                                child: const Text('Edit Profile'),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(0, 50),
                                ),
                                child: const Text('Share Profile'),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  const Divider(color: Colors.blueGrey),

                  GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    childAspectRatio: 1,
                    children: [
                      Image.asset(
                        'assets/images/post1.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image);
                        },
                      ),
                      Image.asset(
                        'assets/images/post2.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image);
                        },
                      ),
                      Image.asset(
                        'assets/images/post3.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image);
                        },
                      ),
                      Image.asset(
                        'assets/images/post4.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image);
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BlurDialogRoute<T> extends PopupRoute<T> {
  @override
  Color get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Dismiss logout confirmation';
  BlurDialogRoute({required this.builder});

  final WidgetBuilder builder;
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 150);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Center(child: builder(context));
  }
}
