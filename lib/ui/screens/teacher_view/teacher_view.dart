import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project/global_var.dart';
import 'package:project/ui/screens/clear_your_doubts.dart';
import 'package:project/ui/screens/home_screen.dart';
import 'package:project/ui/screens/teacher_view/add_profile_details_screen.dart';
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
    ClearYourDoubtsScreen(),
    HomeScreen(),
    AddUserDetailsScreen(),
  ];
  @override
  void initState() {
    super.initState();
    setRole();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Teacher view"),
          actions: [
            InkWell(
                onTap: () async {
                  signOut();
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.clear();
                  // ignore: use_build_context_synchronously
                  await Navigator.pushReplacementNamed(context, "/LoginScreen");
                },
                child: const Icon(
                  Icons.logout_outlined,
                )),
          ]),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
              GButton(icon: Icons.settings, text: "Study"),
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.person_rounded, text: "Profile")
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
