// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedButton extends StatelessWidget {
  var ontap;
  String title;
  var color;
  RoundedButton({
    super.key,
    required this.ontap,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            // color: Color(0xff6D88E7),
            color: color,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ))),
    );
  }
}
