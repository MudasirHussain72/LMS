// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SubjectType extends StatelessWidget {
  bool isSubjectSelected;
  var subjName;
  var bgColor;
  SubjectType({
    super.key,
    required this.subjName,
    required this.bgColor,
    required this.isSubjectSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (isSubjectSelected == true) {
      return Container(
        height: 50,
        width: 85,
        decoration: BoxDecoration(
          color: Colors.orange[300],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Center(
          child: CircleAvatar(
              radius: (22),
              backgroundColor: bgColor,
              child: Text(
                subjName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange[300],
                ),
              )),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: CircleAvatar(
            radius: (22),
            backgroundColor: bgColor,
            child: Text(
              subjName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            )),
      );
    }
    // return Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 5.0),
    //   child: CircleAvatar(
    //       child: Text(
    //         subjName,
    //         style: TextStyle(
    //           fontSize: 20,
    //           fontWeight: FontWeight.w600,
    //           color: Colors.white,
    //         ),
    //       ),
    //       radius: (22),
    //       backgroundColor: bgColor),
    // );
  }
}
