import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/auth_widgets/my_textfiled.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';
import 'package:project/widgets/auth_widgets/auth_ui_picture_parts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController userNameController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const UIpathLeft219(),
        const UIpathLeft220(),
        const UIpathLeftCircle(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 90.0, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Hey,\nLogin Now",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              RichText(
                // textDirection: TextDirection.tr,
                text: TextSpan(
                  text: 'if you are new / ',
                  style: const TextStyle(fontSize: 13, color: Colors.black),
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
              MyTextField(
                  controller: userNameController,
                  hintText: "Username",
                  color: const Color(0xff6D88E7)),
              MyTextField(
                  controller: userNameController,
                  hintText: "Password",
                  color: const Color(0xff6D88E7)),
              RichText(
                text: const TextSpan(
                  text: 'Forgot password ? / ',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Reset Now',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RoundedButton(
                  ontap: () {}, title: "Login", color: const Color(0xff6D88E7))
            ],
          ),
        )
      ]),
    );
  }
}
