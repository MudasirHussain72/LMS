import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // String disc = "";
  var disc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('courses').snapshots(),
          builder: (context, snapshots) {
            return (snapshots.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25)),
                            color: Colors.white),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                "SEARCH",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                onChanged: (value) => disc,
                                controller: disc,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.search_rounded),
                                  hintText: "Search for username or course",
                                  hintStyle: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: Colors
                                            .grey.shade300), //<-- SEE HERE
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              )
                            ]),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              var data = snapshots.data!.docs[index].data()
                                  as Map<String, dynamic>;
                              if (disc.text.isEmpty) {
                                return ListTile(
                                  title: Text(
                                    data['disc'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    data['teacherName'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }
                              if (data['disc']
                                  .toString()
                                  .toLowerCase()
                                  .startsWith(
                                      disc.text.toString().toLowerCase())) {
                                return ListTile(
                                  title: Text(
                                    data['disc'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    data['teacherName'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }
                              return Container();
                            }),
                      ),
                    ],
                  );
          },
        ));
  }
}
