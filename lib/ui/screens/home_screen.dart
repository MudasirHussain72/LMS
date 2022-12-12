import 'package:flutter/material.dart';
import 'package:project/widgets/bottomNavBar.dart';
import 'package:project/widgets/course_material.dart';
import 'package:project/widgets/subject_type.dart';
import 'package:project/widgets/user_profile_picture.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // bottomNavigationBar
      // bottomNavigationBar: const MyBottomNavigationBar(),
      // body area
      body: Stack(
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
                  UserProfilePicture(
                      picHeight: 50.0,
                      picWidth: 50.0,
                      imagePath: const NetworkImage(
                          "https://yt3.ggpht.com/-6Au8re7SVGpsht0k2lMIFvH4_Pjy_fFBqBAqOUKVhhToI9zg7vNc9QAu_-PZalw8ZK9zvCC=s108-c-k-c0x00ffffff-no-rj")),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 85,
                    decoration: BoxDecoration(
                      color: Colors.orange[300],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Center(
                      child: CircleAvatar(
                          radius: (22),
                          backgroundColor: Colors.white,
                          child: Text(
                            "CS",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange[300],
                            ),
                          )),
                    ),
                  ),
                  SubjectType(
                      subjName: "CS",
                      bgColor: Colors.purple[400],
                      isSubjectSelected: false),
                  SubjectType(
                      isSubjectSelected: false,
                      subjName: "CS",
                      bgColor: Colors.pink[400]),
                  SubjectType(
                      isSubjectSelected: false,
                      subjName: "CS",
                      bgColor: Colors.brown[700]),
                  SubjectType(
                      isSubjectSelected: false,
                      subjName: "CS",
                      bgColor: Colors.green[400]),
                  SubjectType(
                      isSubjectSelected: false,
                      subjName: "CS",
                      bgColor: Colors.blueAccent[400]),
                  SubjectType(
                      isSubjectSelected: false,
                      subjName: "CS",
                      bgColor: Colors.orange[300])
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 75.0),
            child: Container(
              width: 200,
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
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Introduction\nto Computer",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Professor Abid Raza",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              UserProfilePicture(
                                  picHeight: 60.0,
                                  picWidth: 60.0,
                                  imagePath: const NetworkImage(
                                      "https://yt3.ggpht.com/-6Au8re7SVGpsht0k2lMIFvH4_Pjy_fFBqBAqOUKVhhToI9zg7vNc9QAu_-PZalw8ZK9zvCC=s108-c-k-c0x00ffffff-no-rj")),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  CourseMaterial(courseMaterialTextName: "Assignments"),
                  CourseMaterial(courseMaterialTextName: "Discussion"),
                  CourseMaterial(courseMaterialTextName: "Clear Your Doubts"),
                  CourseMaterial(courseMaterialTextName: "Notes"),
                  CourseMaterial(courseMaterialTextName: "Quiz"),
                  CourseMaterial(courseMaterialTextName: "Teacher Details")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
