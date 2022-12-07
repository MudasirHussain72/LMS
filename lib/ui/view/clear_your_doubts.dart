import 'package:flutter/material.dart';

class ClearYourDoubtsScreen extends StatefulWidget {
  const ClearYourDoubtsScreen({super.key});

  @override
  State<ClearYourDoubtsScreen> createState() => _ClearYourDoubtsScreenState();
}

class _ClearYourDoubtsScreenState extends State<ClearYourDoubtsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("CLEAR YOUR DOUBTS"),
        titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                Expanded(child: Divider()),
                Text(
                  "  NEW MESSAGES  ",
                  style: TextStyle(fontSize: 12),
                ),
                Expanded(child: Divider()),
              ],
            ),
          ),
          // messanges

          Padding(
            padding: const EdgeInsets.only(top: 100.0, bottom: 50),
            child: Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "PROF. ABID RAZA",
                          style: TextStyle(
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
                                children: const <Widget>[
                                  Text(
                                    'Aww',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    'check them out noww!!',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  // Text(
                                  //   'Text 3',
                                  //   style: TextStyle(fontSize: 14),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
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
                    width: 160,
                    child: TextFormField(
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
                  const Icon(Icons.send_rounded, size: 25),
                  const Icon(Icons.photo_size_select_actual_outlined, size: 25),
                ],
              )),
        ]),
      ),
    );
  }
}