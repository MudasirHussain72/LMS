import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ClearYourDoubtsScreen extends StatefulWidget {
  const ClearYourDoubtsScreen({super.key});

  @override
  State<ClearYourDoubtsScreen> createState() => _ClearYourDoubtsScreenState();
}

class _ClearYourDoubtsScreenState extends State<ClearYourDoubtsScreen> {
  TextEditingController sendMess = TextEditingController();
  var collectionRef = FirebaseFirestore.instance.collection("messages");
  Future sendMessage(String messValue) async {
    var collection = FirebaseFirestore.instance.collection('users');
    //userUid is the current auth user
    var docSnapshot =
        await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();

    Map<String, dynamic> data = docSnapshot.data()!;

    userSenderName = data['fullName'];
    //
    FirebaseFirestore.instance.collection('messages').add({
      'text': messValue,
      "userSenderName": userSenderName,
      "timestamp": Timestamp.now()
    });
  }

  static String? userSenderName;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Discussion"),
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
        padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
        child: Stack(children: [
          // new tessamges section text
          Align(
            heightFactor: 10,
            child: Row(
              children: const <Widget>[
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
                Text(
                  "  MESSAGES  ",
                  style: TextStyle(fontSize: 12),
                ),
                Expanded(
                    child: Divider(
                  thickness: 2,
                )),
              ],
            ),
          ),
          // messanges
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 50),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy("timestamp", descending: false)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((document) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            document['userSenderName'],
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: <Widget>[
                                // This is your divider
                                Container(
                                  width: 2,
                                  height: double.infinity,
                                  color: Colors.black,
                                  margin: const EdgeInsets.only(right: 4),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Flexible(
                                        child: Text(
                                          document['text'],
                                          overflow: TextOverflow.visible,
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          // text typing area
          Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: TextFormField(
                      controller: sendMess,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Send a chat",
                          fillColor: Colors.grey[300],
                          focusColor: Colors.grey[300]),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        sendMessage(sendMess.text.trim().toString());
                      },
                      child: const Icon(Icons.send_rounded, size: 25)),
                ],
              )),
        ]),
      ),
    );
  }
}
