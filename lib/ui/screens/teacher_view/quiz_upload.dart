import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';

class QuizUploadScreen extends StatefulWidget {
  var courseDescrip;
  var courseUid;
  QuizUploadScreen(
      {super.key, required this.courseDescrip, required this.courseUid});

  @override
  State<QuizUploadScreen> createState() => _QuizUploadScreenState();
}

class _QuizUploadScreenState extends State<QuizUploadScreen> {
  late Future<ListResult> futureFiles;

  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc'],
    );
    setState(() {
      pickedFile = result!.files.first;
    });
    await uploadFile(widget.courseUid).then((value) {
      var uid = FirebaseAuth.instance.currentUser!.uid;
      // FirebaseFirestore.instance
      //     .collection("users")
      //     .doc(uid)
      //     . set({"coins": userCoins + 200});
    });
  }

  Future uploadFile(String cUid) async {
    var uid = await FirebaseAuth.instance.currentUser!.uid;
    final path = "courses/${widget.courseUid.toString()}" +
        "/" +
        "quiz/" +
        "${pickedFile!.name}";
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
    var uid = FirebaseAuth.instance.currentUser!.uid;
    futureFiles = FirebaseStorage.instance
        .ref("courses/${widget.courseUid.toString()}" + "/" + "quiz/")
        .listAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Quiz"),
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
        child: Stack(children: [
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
                    "Quiz",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                                  style: TextStyle(color: Colors.blue),
                                ),
                                trailing: IconButton(
                                    onPressed: () async {
                                      await file.delete();
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
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
                title: "Quiz Upload",
                color: const Color(0xff6D88E7)),
          )
        ]),
      ),
    );
  }
}
