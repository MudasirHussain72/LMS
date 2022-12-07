import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamed(context, "/StudentView");
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamed(context, "/LoginScreen");
      });
    }
  }
}
