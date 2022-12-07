import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/utils/utils.dart';
import 'package:project/widgets/auth_widgets/my_textfiled.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';
import 'package:project/widgets/auth_widgets/auth_ui_picture_parts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  void login() {
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then(
      (value) {
        Navigator.pushNamed(context, "/HomeScreen");
      },
    ).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();

    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: Stack(alignment: Alignment.center, children: [
          const UIpathLeft219(),
          const UIpathLeft220(),
          const UIpathLeftCircle(),
          Padding(
            padding: const EdgeInsets.only(top: 90.0, left: 24, right: 24),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const Text(
                      "Hey,\nLogin Now",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'if you are new / ',
                        style:
                            const TextStyle(fontSize: 13, color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Create New',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, "/SignUpScreen");
                                }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                    MyTextField(
                        controller: emailController,
                        hintText: "Email",
                        color: const Color(0xff6D88E7)),
                    MyTextField(
                        controller: passwordController,
                        hintText: "Password",
                        color: const Color(0xff6D88E7)),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: 'Forgot password ? / ',
                        style: const TextStyle(fontSize: 13, color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Reset Now',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, "/ResetPassword");
                                }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),
                    RoundedButton(
                        ontap: () {
                          if (_formKey.currentState!.validate()) {
                            login();
                          }
                        },
                        title: "Login",
                        color: const Color(0xff6D88E7))
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
