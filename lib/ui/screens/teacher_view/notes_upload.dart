import 'package:flutter/material.dart';

class NotesUploadScreen extends StatefulWidget {
  var courseDescrip;
  var courseUid;
  NotesUploadScreen(
      {super.key, required this.courseDescrip, required this.courseUid});

  @override
  State<NotesUploadScreen> createState() => _NotesUploadScreenState();
}

class _NotesUploadScreenState extends State<NotesUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
