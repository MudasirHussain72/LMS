import 'package:flutter/material.dart';
import 'package:project/global_var.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherView extends StatelessWidget {
  const TeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
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
