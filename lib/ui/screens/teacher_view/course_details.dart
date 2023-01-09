import 'package:flutter/material.dart';
import 'package:project/ui/screens/teacher_view/teacher_messages.dart';
import 'package:project/widgets/course_material.dart';

class CourseDetails extends StatefulWidget {
  var courseDescrip;
  var courseUid;
  CourseDetails(
      {super.key, required this.courseDescrip, required this.courseUid});
  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // body: Center(child: Text(widget.courseUid.toString())),
      body: Stack(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
              width: size.width / 1.3,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 170, horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          ),
                          SizedBox(width: 16)
                        ],
                      ),
                      SizedBox(height: 16),
                      InkWell(
                        child: CourseMaterial(
                            courseMaterialTextName: "Assignments"),
                      ),
                      SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ClearYourDoubtsScreen()),
                          );
                        },
                        child: CourseMaterial(
                            courseMaterialTextName: "Discussion"),
                      ),
                      SizedBox(height: 16),
                      InkWell(
                        child: CourseMaterial(courseMaterialTextName: "Notes"),
                      ),
                    ]),
              )),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(width: size.width / 6, color: Colors.white),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Column(children: [
              Container(
                height: 70,
                width: size.width / 1.25,
                decoration: BoxDecoration(
                  color: Color(0xff6D88E7),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
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
                      Text(
                        widget.courseDescrip.toString(),
                        style: const TextStyle(
                            // fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ]),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
