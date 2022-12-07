import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/auth_widgets/auth_ui_picture_parts.dart';
import 'package:project/widgets/auth_widgets/my_textfiled.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  bool userType = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;
  var fireStore = FirebaseFirestore.instance.collection("users");
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController gederController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reTypePassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var termsCondi;
  Future SignUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      // create user
      await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          )
          .then((value) {store..collection('user').doc(value.user!.uid).set(data);});
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      showDialog(
          context: context,
          builder: (context) {
            return Center(
              child: Text(e.message.toString()),
            );
          });
    }

    await fireStore.doc(_auth.currentUser!.uid).set({
      'Name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': int.parse(
        phoneController.text.trim(),
      ),
      'gender': gederController.text.trim(),
      "userType": userType
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const UIpathLeft219(),
        const UIpathLeft220(),
        const UIpathLeftCircle(),
        Padding(
            padding: const EdgeInsets.only(
                top: 90.0, right: 24, left: 24, bottom: 24),
            child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Create New\nAccount",
                            style: TextStyle(
                                fontSize: 34, fontWeight: FontWeight.bold),
                          ),
                          RichText(
                            // textDirection: TextDirection.tr,
                            text: TextSpan(
                              text: 'if you are member already / ',
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                              children: [
                                TextSpan(
                                    text: 'Login',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context, "/");
                                      }),
                              ],
                            ),
                          ),
                          MyTextField(
                              controller: nameController,
                              hintText: "Full name",
                              color: const Color(0xff6D88E7)),
                          MyTextField(
                              controller: emailController,
                              hintText: "E-mail",
                              color: const Color(0xff6D88E7)),
                          MyTextField(
                              controller: phoneController,
                              hintText: "Phone Number",
                              color: const Color(0xff6D88E7)),
                          MyTextField(
                              controller: gederController,
                              hintText: "Gender",
                              color: const Color(0xff6D88E7)),
                          MyTextField(
                              controller: passwordController,
                              hintText: "Password",
                              color: const Color(0xff6D88E7)),
                          MyTextField(
                              controller: reTypePassController,
                              hintText: "Re-type Password",
                              color: const Color(0xff6D88E7)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "Student",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Switch(
                                  activeColor: const Color(0xff6D88E7),
                                  value: userType,
                                  onChanged: (bool value) {
                                    setState(() {
                                      userType = value;
                                    });
                                  }),
                              const Text(
                                "Teacher",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          RadioListTile(
                            activeColor: const Color(0xff6D88E7),
                            title:
                                const Text("I agree to all terms & conditions"),
                            value: "hello",
                            groupValue: termsCondi,
                            onChanged: (value) {
                              setState(() {
                                termsCondi = value.toString();
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          RoundedButton(
                              ontap: () {
                                if (_formKey.currentState!.validate()) {
                                  SignUp();
                                }
                              },
                              title: "Sign Up",
                              color: const Color(0xff6D88E7))
                        ],
                      ),
                    ],
                  ),
                )))
      ]),
    );
  }
}
