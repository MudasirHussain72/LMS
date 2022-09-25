import 'package:flutter/material.dart';
import 'package:project/auth/login.dart';
import 'package:project/auth/sign_up.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LMS",
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginScreen(),
        "/SignUpScreen": (context) => const SignUp(),
      },
    );
  }
}
