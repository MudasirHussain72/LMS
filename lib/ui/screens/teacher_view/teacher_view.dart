import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project/ui/screens/teacher_view/teacher_courses.dart';
import 'package:project/ui/screens/teacher_view/teacher_messages.dart';
import 'package:project/ui/screens/teacher_view/teacher_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherView extends StatefulWidget {
  const TeacherView({super.key});

  @override
  State<TeacherView> createState() => _TeacherViewState();
}

class _TeacherViewState extends State<TeacherView> {
  void setRole() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isTeacher', true);
  }

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    TeacherCourses(),
    ClearYourDoubtsScreen(),
    // AddUserDetailsScreen(),
    TeacherProfile()
  ];
  @override
  void initState() {
    super.initState();
    setRole();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            iconSize: 24,
            tabBackgroundColor: Colors.grey.shade800,
            padding: const EdgeInsets.all(16),
            gap: 8,
            tabs: const [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.message_rounded, text: "Teach"),
              GButton(icon: Icons.person_rounded, text: "Profile"),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
