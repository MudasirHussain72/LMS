import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {
  void isLogin(BuildContext context) async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    final prefs = await SharedPreferences.getInstance();
    final bool? isTeacher = prefs.getBool('isTeacher');
    if (user != null && isTeacher == false) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, "/StudentView");
      });
    } else if (user != null && isTeacher == true) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, "/TeacherView");
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, "/LoginScreen");
      });
    }
  }
}
