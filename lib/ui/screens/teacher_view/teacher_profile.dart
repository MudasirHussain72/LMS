import 'package:flutter/material.dart';
import 'package:project/widgets/auth_widgets/profile_ui_parts.dart';

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({super.key});

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [ProfileUiTopRight220()]),
    );
  }
}
