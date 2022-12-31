// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';

class Assignments extends StatefulWidget {
  var courseUid;
  Assignments({super.key, required this.courseUid});

  @override
  State<Assignments> createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  var userCoins = 0000;
  Future getCoins() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((event) {
      // you can access the values by
      userCoins = event['coins'];
    });
    setState(() {});
  }

  late Future<ListResult> futureFiles;
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    setState(() {
      pickedFile = result!.files.first;
    });
    await uploadFile(widget.courseUid).then((value) {
      var uid = FirebaseAuth.instance.currentUser!.uid;
      FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set({"coins": userCoins + 200});
    });
  }

  Future uploadFile(String cUid) async {
    final path = "courses/$cUid/${pickedFile!.name}";
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    log("download link: $urlDownload");
  }

  @override
  void initState() {
    super.initState();
    futureFiles = FirebaseStorage.instance
        .ref("courses/${widget.courseUid.toString()}/")
        .listAll();
    getCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
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
                      Expanded(
                        child: FutureBuilder<ListResult>(
                          future: futureFiles,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final files = snapshot.data!.items;
                              return ListView.builder(
                                itemCount: files.length,
                                itemBuilder: (context, index) {
                                  final file = files[index];
                                  return ListTile(
                                    title: Text(
                                      file.name,
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.download)),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return const Text("error occured");
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
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
                      Expanded(
                        child: FutureBuilder<ListResult>(
                          future: futureFiles,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final files = snapshot.data!.items;
                              return ListView.builder(
                                itemCount: files.length,
                                itemBuilder: (context, index) {
                                  final file = files[index];
                                  return ListTile(
                                    title: Text(
                                      file.name,
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.delete)),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return const Text("error occured");
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      )
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
