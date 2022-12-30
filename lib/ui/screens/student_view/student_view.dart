import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project/ui/screens/student_view/my_rewards.dart';
import 'package:project/ui/screens/student_view/search.dart';
import 'package:project/ui/screens/student_view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentView extends StatefulWidget {
  const StudentView({super.key});
  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  void setRole() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isTeacher', false);
  }

  int _selectedIndex = 1;

  static const List<Widget> _widgetOptions = <Widget>[
    MyRewards(),
    HomeScreen(),
    // StudentMsgScreen(),
    Search()
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
              GButton(
                icon: Icons.emoji_events_outlined,
              ),
              GButton(
                icon: Icons.home,
              ),
              GButton(
                icon: Icons.search_rounded,
              ),
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
