// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';

class Assignments extends StatefulWidget {
  var courseUid;
  Assignments({super.key, required this.courseUid});

  @override
  State<Assignments> createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  // PlatformFile? pickedFile;
  Future selectFile() async {
    // final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    setState(() {
      // pickedFile = result!.files.first;
    });
    // final path = await FlutterDocumentPicker.openDocument();
    // print(path);
    // File file = File(path!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("ASSIGNMENTS"),
        titleTextStyle:
            const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        centerTitle: true,
        flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)))),
      ),
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 2.7,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "What to do?",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        overflow: TextOverflow.visible,
                        "Everything is described in the attached file please download the file",
                        style: TextStyle(fontSize: 10),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("assignment.pdf"),
                          Icon(Icons.download)
                        ],
                      )
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height / 2.7,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Upload",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("assignment.pdf"),
                          Icon(Icons.delete)
                        ],
                      ),
                    ]),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RoundedButton(
                    ontap: () {
                      selectFile();
                    },
                    title: "upload",
                    color: const Color(0xff6D88E7)),
              )
            ]),
      ),
    );
  }
}
