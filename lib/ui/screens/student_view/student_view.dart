import 'package:flutter/material.dart';
import 'package:project/global_var.dart';
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
      body: const Center(child: Text("student view")),
    );
  }
}
