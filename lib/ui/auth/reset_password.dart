import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/auth_widgets/auth_ui_picture_parts.dart';
import 'package:project/widgets/auth_widgets/my_textfiled.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController resetPasswordController = TextEditingController();

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
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Update\nPassword",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text:
                      "Dont't worry! it happens. Please enter the address associated with your account.",
                  style: const TextStyle(fontSize: 13, color: Colors.black),
                  children: [
                    TextSpan(
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
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: resetPasswordController,
                  hintText: "Email ID",
                  color: const Color(0xff6D88E7)),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
            child: RoundedButton(
                ontap: () {}, title: "Reset", color: const Color(0xff6D88E7)),
          ),
        )
      ]),
    );
  }
}
