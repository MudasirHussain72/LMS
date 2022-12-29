import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:project/ui/screens/student_view/coupons.dart';
import 'package:project/ui/screens/student_view/student_profile.dart';
import 'package:project/ui/screens/teacher_view/add_profile_details_screen.dart';
import 'package:project/ui/auth/login.dart';
import 'package:project/ui/auth/reset_password.dart';
import 'package:project/ui/auth/sign_up.dart';
import 'package:project/ui/screens/home_screen.dart';
import 'package:project/ui/screens/splash_screen.dart';
import 'package:project/ui/screens/student_view/student_view.dart';
import 'package:project/ui/screens/teacher_view/teacher_course_details.dart';
import 'package:project/ui/screens/teacher_view/teacher_courses.dart';
import 'package:project/ui/screens/teacher_view/teacher_profile.dart';
import 'package:project/ui/screens/teacher_view/teacher_view.dart';
import 'firebase_options.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
        "/TeacherView": (context) => const TeacherView(),
        "/TeacherProfile": (context) => const TeacherProfile(),
        "/TeacherCourses": (context) => const TeacherCourses(),
        "/TeacherCourseDetails": (context) => const TeacherCourseDetails(),
        "/StudentProfile": (context) => const StudentProfile(),
        "/Reward": (context) => const Reward(),

      },
    );
  }
}
