import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:project/ui/screens/student_view/student_view.dart';
import 'package:project/utils/utils.dart';
import 'package:project/widgets/auth_widgets/auth_ui_picture_parts.dart';
import 'package:project/widgets/auth_widgets/my_textfiled.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';

class OTP extends StatefulWidget {
  String verificationId;
  OTP({required this.verificationId});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final _auth = FirebaseAuth.instance;

  TextEditingController verifyController = TextEditingController();
  @override
  void dispose() {
    verifyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const UIpathLeft219(),
          const UIpathLeft220(),
          const UIpathLeftCircle(),
          //
          Padding(
              padding: const EdgeInsets.only(top: 90.0, left: 24, right: 24),
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: ListView(children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "O.T.P,\nVerification",
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "We've sent a 4 digit code to your registered number and email, please enter the code before time runs out",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [Text("3:35")],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Center(
                          child: SizedBox(
                              width: 268,
                              height: 88,
                              child: Pinput(
                                // controller: verifyController,
                                length: 4,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                              )),
                        ),
                        MyTextField(
                            controller: verifyController,
                            hintText: "verify otp",
                            color: const Color(0xff6D88E7)),
                        const SizedBox(
                          height: 20,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Do not received yet? / ',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.black),
                            children: [
                              TextSpan(
                                  text: 'Send Again',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(
                                          context, "/AddDetails");
                                    }),
                            ],
                          ),
                        ),
                        RoundedButton(
                            ontap: () async {
                              final credential = PhoneAuthProvider.credential(
                                  verificationId:
                                      widget.verificationId.toString(),
                                  smsCode: verifyController.text.toString());
                              try {
                                await _auth.signInWithCredential(credential);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StudentView(),
                                  ),
                                );
                              } catch (e) {
                                Utils().toastMessage(e.toString());
                              }
                            },
                            title: "verify",
                            color: const Color(0xff6D88E7))
                      ]),
                ]),
              ))
        ],
      ),
    );
  }
}
