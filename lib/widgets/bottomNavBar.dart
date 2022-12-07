import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(),
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.outer,
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.people_alt_rounded,
            color: Colors.grey[600],
          ),
          Container(
            height: 55,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.home),
          ),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut().then(
                  (value) => Navigator.pushNamed(context, "/LoginScreen"));
            },
            child: Icon(
              Icons.search_rounded,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
