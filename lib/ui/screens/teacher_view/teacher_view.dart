import 'package:flutter/material.dart';
import 'package:project/global_var.dart';
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

  @override
  void initState() {
    super.initState();
    setRole();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
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
            ))
      ]),
      body: const Center(child: Text("Teacher view")),
    );
  }
}
