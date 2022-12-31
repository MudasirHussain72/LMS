// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';

class Assignments extends StatefulWidget {
  var courseUid;
  Assignments({super.key, required this.courseUid});

  @override
  State<Assignments> createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("ASSIGNMENTS"),
        titleTextStyle:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        centerTitle: true,
        flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)))),
      ),
      body: Column(children: [
        RoundedButton(
            ontap: () {}, title: "upload", color: const Color(0xff6D88E7))
      ]),
    );
  }
}
