import 'dart:ui';

import 'package:flutter/material.dart';

class ShowTeacherDetails extends StatefulWidget {
  var teacherName;
  var teacherEmail;
  var teacherPhone;
  var teacherUid;

  ShowTeacherDetails({
    super.key,
    required this.teacherName,
    required this.teacherEmail,
    required this.teacherPhone,
    required this.teacherUid,
  });

  @override
  State<ShowTeacherDetails> createState() => _ShowTeacherDetailsState();
}

class _ShowTeacherDetailsState extends State<ShowTeacherDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Teacher Details"),
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
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 350,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    child: Icon(Icons.person),
                    radius: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Teacher Name",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text(widget.teacherName.toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Teacher Email",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text(widget.teacherEmail.toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Teacher Phone",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text(widget.teacherPhone.toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Teacher UID",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text(widget.teacherUid.toString(),
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500))
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
