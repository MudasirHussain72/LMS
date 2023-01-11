import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class QuizScreen extends StatefulWidget {
  var courseUid;
  QuizScreen({super.key, required this.courseUid});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // late Future<ListResult> futureFiles;
  late Future<ListResult> future2Files;
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
    future2Files = FirebaseStorage.instance
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Quiz will be uploaded by teacher time to time",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        ),
      ),
    );
  }
}
