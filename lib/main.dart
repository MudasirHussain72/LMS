import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/ui/auth/add_profile_details_screen.dart';
import 'package:project/ui/auth/login.dart';
import 'package:project/ui/auth/otp_screen.dart';
import 'package:project/ui/auth/reset_password.dart';
import 'package:project/ui/auth/sign_up.dart';
import 'package:project/ui/screens/home_screen.dart';
import 'package:project/ui/screens/splash_screen.dart';
import 'package:project/ui/screens/student_view/student_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
        "/": (context) => const SplashScreen(),
        "/LoginScreen": (context) => const LoginScreen(),
        "/SignUpScreen": (context) => const SignUp(),
        "/ResetPassword": (context) => const ResetPassword(),
        "/AddDetails": (context) => const AddUserDetailsScreen(),
        "/HomeScreen": (context) => const HomeScreen(),
        "/StudentView": (context) => const StudentView(),
      },
    );
  }
}
