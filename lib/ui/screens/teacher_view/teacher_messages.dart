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
    FirebaseFirestore.instance.collection('messages').add({
      'text': messValue,
    });
  }

  static String? userSenderName;
  static void showDisplayName() async {
    var collection = FirebaseFirestore.instance.collection('users');
    //userUid is the current auth user
    var docSnapshot =
        await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();

    Map<String, dynamic> data = docSnapshot.data()!;

    userSenderName = data['fullName'];
  }

  @override
  void initState() {
    super.initState();
    showDisplayName();
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
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Stack(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Ask any query\nfrom Teacher",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.orange.shade300,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        blurStyle: BlurStyle.outer,
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://yt3.ggpht.com/-6Au8re7SVGpsht0k2lMIFvH4_Pjy_fFBqBAqOUKVhhToI9zg7vNc9QAu_-PZalw8ZK9zvCC=s108-c-k-c0x00ffffff-no-rj"))),
              ),
            ],
          ),
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
                  .orderBy("text", descending: false)
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
                            userSenderName.toString(),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      document['text'],
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    // Text(
                                    //   'check them out noww!!',
                                    //   style: TextStyle(fontSize: 13),
                                    // ),
                                  ],
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
