import 'package:flutter/material.dart';
import 'package:project/widgets/auth_widgets/auth_ui_picture_parts.dart';
import 'package:project/widgets/auth_widgets/my_textfiled.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';

class AddUserDetailsScreen extends StatefulWidget {
  const AddUserDetailsScreen({super.key});

  @override
  State<AddUserDetailsScreen> createState() => _AddUserDetailsScreenState();
}

class _AddUserDetailsScreenState extends State<AddUserDetailsScreen> {
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const UIpathLeft219(),
        const UIpathLeft220(),
        const UIpathLeftCircle(),
        Padding(
            padding: const EdgeInsets.only(
                top: 90.0, left: 24, right: 24, bottom: 24),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Add Your\nProfile Details",
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Upload Your\nProfile Picture",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.orange.shade300,
                                ),
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
                                        "https://yt3.ggpht.com/-6Au8re7SVGpsht0k2lMIFvH4_Pjy_fFBqBAqOUKVhhToI9zg7vNc9QAu_-PZalw8ZK9zvCC=s108-c-k-c0x00ffffff-no-rj"))),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(thickness: 2.0),
                      const SizedBox(
                        height: 5,
                      ),
                      const Center(
                        child: Text("Select Courses You Teach"),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      MyTextField(
                          controller: courseNameController,
                          hintText: "Introduction to computer",
                          color: const Color(0xff6D88E7)),
                      MyTextField(
                          controller: courseTypeController,
                          hintText: "Advanced Physics II",
                          color: const Color(0xff6D88E7)),
                      const SizedBox(height: 20),
                      RoundedButton(
                          ontap: () {}, title: "Add", color: Colors.orange),
                      const SizedBox(height: 20),
                      RoundedButton(
                          ontap: () {},
                          title: "Get Started",
                          color: const Color(0xff6D88E7))
                    ],
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
