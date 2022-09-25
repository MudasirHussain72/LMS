import 'package:flutter/material.dart';
class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
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
              child: Icon(Icons.home),
            ),
            Icon(
              Icons.search_rounded,
              color: Colors.grey[600],
            ),
          ],
        ),
      );
  }
}