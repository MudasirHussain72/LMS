// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/auth_widgets/my_textfiled.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';

class TeacherCourses extends StatefulWidget {
  const TeacherCourses({super.key});

  @override
  State<TeacherCourses> createState() => _TeacherCoursesState();
}

class _TeacherCoursesState extends State<TeacherCourses> {
  static String? profName;
  static int? profPhone;

  var name;
  var email;
  var phone;
  static String? uid;
  static void showDisplayName() async {
    var collection = FirebaseFirestore.instance.collection('users');
    var coursesCollection = FirebaseFirestore.instance.collection('courses');
    //userUid is the current auth user
    var docSnapshot =
        await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    Map<String, dynamic> data = docSnapshot.data()!;
    profName = data['fullName'];
    profPhone = data['phone'];

    var docSnapshot2 = await collection.doc().get();
    Map<String, dynamic> data2 = docSnapshot2.data()!;
    uid = data2['fullName'];
  }

  Future<void> getuserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((event) {
      // you can access the values by
      name = event['fullName'];
      email = event['email'];
      phone = event['phone'];
    });
    setState(() {});
  }

  var courseNameController = TextEditingController();
  var courseDiscController = TextEditingController();
  void createCourse() {
    var newDocRef = FirebaseFirestore.instance.collection('courses').doc();
    newDocRef.set({
      "title": courseNameController.text.trim().toString(),
      "disc": courseDiscController.text.trim().toString(),
      "teacherUid": FirebaseAuth.instance.currentUser!.uid,
      "teacherName": profName.toString(),
      "teacherEmail": FirebaseAuth.instance.currentUser!.email,
      "teacherPhone": profPhone,
      "courseUid": newDocRef.id
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    showDisplayName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xff6D88E7),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Icon(Icons.person, size: 50),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 20),
                  child: Text(
                    "Prof. ${"$profName".toUpperCase()}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 180, left: 25),
          child: Text(
            "My Courses",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 210, bottom: 50, left: 15, right: 15),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('courses')
                // .orderBy("text", descending: false)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context, "/TeacherCourseDetails");
                      },
                      child: Container(
                        height: 90,
                        // width: 140,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[200],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Center(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(width: 20),
                              const CircleAvatar(backgroundColor: Colors.black),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    document['title'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    document['disc'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
            child: RoundedButton(
                ontap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Center(child: Text("Add Course")),
                      content: SizedBox(
                        height: 240,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Course Name"),
                            MyTextField(
                                controller: courseNameController,
                                hintText: "",
                                color: Colors.amber),
                            const Text("Course Discription"),
                            MyTextField(
                                controller: courseDiscController,
                                hintText: "",
                                color: Colors.amber),
                            Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    createCourse();
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Create")),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                title: "Add Course",
                color: const Color(0xff6D88E7)),
          ),
        )
      ]),
    );
  }
}
