import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project/auth/login.dart';
import 'package:project/widgets/auth_widgets/auth_ui_picture_parts.dart';
import 'package:project/widgets/auth_widgets/my_textfiled.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var termsCondi = null;
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
                            controller: userNameController,
                            hintText: "Full name",
                            color: const Color(0xff6D88E7)),
                        MyTextField(
                            controller: userNameController,
                            hintText: "E-mail",
                            color: const Color(0xff6D88E7)),
                        MyTextField(
                            controller: userNameController,
                            hintText: "Phone Number",
                            color: const Color(0xff6D88E7)),
                        MyTextField(
                            controller: userNameController,
                            hintText: "Gender",
                            color: const Color(0xff6D88E7)),
                        MyTextField(
                            controller: userNameController,
                            hintText: "Password",
                            color: const Color(0xff6D88E7)),
                        MyTextField(
                            controller: userNameController,
                            hintText: "Re-type Password",
                            color: const Color(0xff6D88E7)),
                        // RichText(
                        //   text: const TextSpan(
                        //     text: 'Forgot password ? / ',
                        //     style: TextStyle(fontSize: 13, color: Colors.black),
                        //     children: [
                        //       TextSpan(
                        //         text: 'I agree to all terms & conditions',
                        //         style: TextStyle(
                        //           fontSize: 15,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        RadioListTile(
                          title: Text("I agree to all terms & conditions"),
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
                            ontap: () {},
                            title: "Sign Up",
                            color: const Color(0xff6D88E7))
                      ],
                    ),
                  ],
                ))
            //
            // SingleChildScrollView(

            // ),
            )
      ]),
    );
  }
}
