import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  String hintText;
  // ignore: prefer_typing_uninitialized_variables
  var controller;
  var color;
  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "plz enter...";
          } else {
            return null;
          }
        },
        controller: controller,
        cursorColor: color,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(9.0),
            ),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: hintText,
            fillColor: Colors.grey[300],
            focusColor: Colors.grey[300]),
      ),
    );
  }
}
