// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/global_var.dart';
import 'package:project/widgets/auth_widgets/profile_ui_parts.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherProfile extends StatefulWidget {
  const TeacherProfile({super.key});

  @override
  State<TeacherProfile> createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
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

  var _textFieldController = TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context, String a) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Edit section'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "edit"),
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
                  child: const Text("edit"))
            ],
          );
        });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getuserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const ProfileUiTopRight220(),
        const ProfileUiTopleft220(),
        const ProfileUibottom220(),
        Padding(
          padding: const EdgeInsets.only(top: 90.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange.shade300, width: 2),
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
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Align(
            alignment: Alignment.bottomCenter,
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
                            icon: const Icon(Icons.edit))
                      ],
                    )),
                    SizedBox(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email"),
                        Text(email.toString()),
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
                            icon: const Icon(Icons.edit))
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
                        title: "Log Out",
                        color: const Color(0xff6D88E7))
                  ]),
            ),
          ),
        )
      ]),
    );
  }
}
