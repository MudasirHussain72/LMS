import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search_rounded),
                    hintText: "Search for username or course",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Colors.grey.shade300), //<-- SEE HERE
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                )
              ]),
        )
      ]),
    );
  }
}
