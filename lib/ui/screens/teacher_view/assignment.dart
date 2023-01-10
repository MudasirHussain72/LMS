import 'package:flutter/material.dart';

class AssignmentUploadScreen extends StatefulWidget {
  var courseDescrip;
  var courseUid;
  AssignmentUploadScreen(
      {super.key, required this.courseDescrip, required this.courseUid});

  @override
  State<AssignmentUploadScreen> createState() => _AssignmentUploadScreenState();
}

class _AssignmentUploadScreenState extends State<AssignmentUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
