// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/ui/screens/student_view/assignments.dart';
import 'package:project/ui/screens/student_view/notes.dart';
import 'package:project/ui/screens/student_view/teacher_details.dart';
import 'package:project/widgets/course_material.dart';
import 'package:project/widgets/subject_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> getCourses() async {
    await FirebaseFirestore.instance.collection("courses").get();
  }

  final courses = FirebaseFirestore.instance.collection("courses").snapshots();
  bool isSelected = false;
  var selectedCourseIndex;
  @override
  void initState() {
    getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: StreamBuilder<QuerySnapshot>(
          stream: courses,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Text("error");
            }
            return Stack(
              children: [
                Container(
                  width: 70,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/StudentProfile");
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.orange.shade300, width: 2),
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
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  isSelected = true;
                                  selectedCourseIndex = index;
                                  setState(() {});
                                },
                                child: SubjectType(
                                    subjName: snapshot
                                        .data!.docs[index]["title"]
                                        .toString(),
                                    bgColor: Colors.purple[400],
                                    isSubjectSelected: false),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                isSelected
                    ? Padding(
                        padding: const EdgeInsets.only(left: 75.0),
                        child: Container(
                          width: 220,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              topLeft: Radius.circular(10.0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 90,
                                width: 220,
                                decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot
                                                    .data!
                                                    .docs[selectedCourseIndex]
                                                        ["disc"]
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                snapshot
                                                    .data!
                                                    .docs[selectedCourseIndex]
                                                        ["teacherName"]
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // Text(
                                              //   snapshot
                                              //       .data!
                                              //       .docs[selectedCourseIndex]
                                              //           ["courseUid"]
                                              //       .toString(),
                                              //   style: const TextStyle(
                                              //     fontSize: 8,
                                              //     color: Colors.white,
                                              //   ),
                                              // )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        Colors.orange.shade300,
                                                    width: 2),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurStyle: BlurStyle.outer,
                                                    color: Colors.grey,
                                                    blurRadius: 2.0,
                                                    spreadRadius: 0.0,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: const DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX25634104.jpg"))),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.orange.shade300,
                                  ),
                                  Text(
                                    "Course Material",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.orange.shade300,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_rounded,
                                    color: Colors.orange.shade300,
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Assignments(
                                            courseUid: snapshot
                                                .data!
                                                .docs[selectedCourseIndex]
                                                    ["courseUid"]
                                                .toString(),
                                          )),
                                ),
                                child: CourseMaterial(
                                    courseMaterialTextName: "Assignments"),
                              ),
                              InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, "/StudentMsgScreen"),
                                child: CourseMaterial(
                                    courseMaterialTextName: "Discussion"),
                              ),
                              InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, "/StudentMsgScreen"),
                                child: CourseMaterial(
                                    courseMaterialTextName:
                                        "Clear Your Doubts"),
                              ),
                              InkWell(
                                  onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NotesScreen(
                                                  courseUid: snapshot
                                                      .data!
                                                      .docs[selectedCourseIndex]
                                                          ["courseUid"]
                                                      .toString(),
                                                )),
                                      ),
                                  child: CourseMaterial(
                                      courseMaterialTextName: "Notes")),
                              CourseMaterial(courseMaterialTextName: "Quiz"),
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ShowTeacherDetails(
                                            teacherEmail: snapshot
                                                .data!
                                                .docs[selectedCourseIndex]
                                                    ["teacherEmail"]
                                                .toString(),
                                            teacherName: snapshot
                                                .data!
                                                .docs[selectedCourseIndex]
                                                    ["teacherName"]
                                                .toString(),
                                            teacherPhone: snapshot
                                                .data!
                                                .docs[selectedCourseIndex]
                                                    ["teacherPhone"]
                                                .toString(),
                                            teacherUid: snapshot
                                                .data!
                                                .docs[selectedCourseIndex]
                                                    ["teacherUid"]
                                                .toString(),
                                          )),
                                ),
                                child: CourseMaterial(
                                    courseMaterialTextName: "Teacher Details"),
                              )
                            ],
                          ),
                        ),
                      )
                    : const Center(child: Text("Please select a course"))
              ],
            );
          },
        ));
  }
}
