import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project/widgets/auth_widgets/rounded_button.dart';

class AssignmentUploadScreen extends StatefulWidget {
  var courseDescrip;
  var courseUid;
  AssignmentUploadScreen(
      {super.key, required this.courseDescrip, required this.courseUid});

  @override
  State<AssignmentUploadScreen> createState() => _AssignmentUploadScreenState();
}

class _AssignmentUploadScreenState extends State<AssignmentUploadScreen> {
  late Future<ListResult> futureFiles;
  late Future<ListResult> future2Files;

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
    final path =
        "courses/${widget.courseUid.toString()}" + "/" + "${pickedFile!.name}";
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    log("download link: $urlDownload");
  }

  Future downloadFile(Reference ref) async {
    /// Not visible for user final dir = await getApplicationDocumentsDirectory();
    // final dir = await getApplicationSupportDirectory();
    // final file = File('${dir.path}/${ref.name}');
    // await ref.writeToFile(file);
    final url = await ref.getDownloadURL();
    final tempDir = await getTemporaryDirectory();
    final path = '${tempDir.path}/${ref.name}';
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    if (statuses[Permission.storage]!.isGranted) {
      var dir = await DownloadsPathProvider.downloadsDirectory;
      if (dir != null) {
        String savename = path.toString();
        String savePath = "${dir.path}/$savename";
        print(savePath);
        //output:  /storage/emulated/0/Download/banner.png

        try {
          await Dio().download(url, savePath,
              onReceiveProgress: (received, total) {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) + "%");
              //you can build progressbar feature too
            }
          });
          print("File is saved to download folder.");
        } on DioError catch (e) {
          print(e.message);
        }
      }
    } else {
      print("No permission to read and write.");
    }

    // File file = File(path);
    // Uint8List bytes = await file.readAsBytes();
    // await FileSaver.instance.saveAs(path., bytes, mimeType: MimeType.PDF,);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Downloaded ${ref.name}')),
    );
  }

  @override
  void initState() {
    super.initState();
    var uid = FirebaseAuth.instance.currentUser!.uid;
    futureFiles = FirebaseStorage.instance
        .ref("courses/${widget.courseUid.toString()}/")
        .listAll();
    future2Files = FirebaseStorage.instance
        .ref("courses/${widget.courseUid.toString()}" + "/" + "assigUpload/")
        .listAll();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Column(children: [
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
                      "Assignment",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
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
            SizedBox(height: 10),
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
                      "Assignments\nuploaded by students",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                        future: future2Files,
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
                                      onPressed: () => downloadFile(file),
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
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomCenter,
              child: RoundedButton(
                  ontap: () {
                    selectFile();
                  },
                  title: "Upload New Assignment",
                  color: const Color(0xff6D88E7)),
            )
          ]),
        ),
      ),
    );
  }
}
