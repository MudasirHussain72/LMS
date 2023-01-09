// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/global_var.dart';
import 'package:project/widgets/auth_widgets/profile_ui_parts.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  var name;
  var email;
  var phone;

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

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getuserData();
  }

  var _textFieldController = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context, String a) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit section'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "edit"),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    var collection =
                        FirebaseFirestore.instance.collection('users');
                    collection
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .update({
                          a: _textFieldController.text.trim().toString()
                        }) // <-- Updated data
                        .then((_) => Navigator.pop(context))
                        .catchError((error) => print('Failed: $error'));
                    setState(() {});
                  },
                  child: Text("edit"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(children: [
        const ProfileUiTopRight220(),
        const ProfileUiTopleft220(),
        const ProfileUibottom220(),
        // const Padding(
        //   padding: EdgeInsets.only(top: 90.0),
        //   child: Align(
        //     alignment: Alignment.topCenter,
        //     child: CircleAvatar(
        //       backgroundColor: Colors.black,
        //       radius: 50,
        //       child: Icon(
        //         Icons.person,
        //         color: Colors.yellow,
        //         size: 40,
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Name"),
                            Text(name.toString().toUpperCase()),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              _displayTextInputDialog(context, "fullName");
                            },
                            icon: Icon(Icons.edit))
                      ],
                    )),
                    SizedBox(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Email"),
                            Text(email.toString()),
                          ],
                        ),
                      ],
                    )),
                    SizedBox(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Phone"),
                            Text(phone.toString()),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              _displayTextInputDialog(context, "phone");
                            },
                            icon: Icon(Icons.edit))
                      ],
                    )),
                    SizedBox(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Password"),
                        Text("********"),
                      ],
                    )),
                    RoundedButton(
                        ontap: () async {
                          signOut();
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          await preferences.clear();
                          // ignore: use_build_context_synchronously
                          await Navigator.pushReplacementNamed(
                              context, "/LoginScreen");
                        },
                        title: "LogOut",
                        color: const Color(0xff6D88E7))
                  ]),
            ),
          ),
        )
      ]),
    );
  }
}
