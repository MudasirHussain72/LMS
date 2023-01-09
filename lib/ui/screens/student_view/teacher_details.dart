// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 350,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.orange.shade300, width: 2),
                        boxShadow: const [
                          BoxShadow(
                            blurStyle: BlurStyle.outer,
                            color: Colors.grey,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX25634104.jpg"))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Teacher Name",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text(widget.teacherName.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Teacher Email",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text(widget.teacherEmail.toString(),
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Teacher Phone",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text(widget.teacherPhone.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text("Teacher UID",
                  //         style: TextStyle(
                  //             fontSize: 14, fontWeight: FontWeight.w500)),
                  //     Text(widget.teacherUid.toString(),
                  //         style: const TextStyle(
                  //             fontSize: 10, fontWeight: FontWeight.w500))
                  //   ],
                  // )
                ]),
          ),
        ),
      ),
    );
  }
}
