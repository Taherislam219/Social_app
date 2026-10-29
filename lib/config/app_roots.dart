import 'package:first_app/pages/Main_page.dart';
import 'package:first_app/pages/edit_profile_page.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:first_app/pages/nearby_page.dart';
import 'package:first_app/resposive_wrapper.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const login = '/';
  static const home = '/home';
  static const main = '/main';
  static const editProfile = '/edit_profile';
  static const nearby = '/nearby';

  static Widget responsive(Widget page) {
    return ResponsiveWrapper(child: page);
  }

  static final pages = {
    login: (context) => responsive(LoginPage()),
    home: (context) => responsive(HomePage()),
    main: (context) => responsive(Mainpage()),
    editProfile: (context) => responsive(EditProfilePage()),
    nearby: (context) => responsive(NearbyPage()),
  };
}
