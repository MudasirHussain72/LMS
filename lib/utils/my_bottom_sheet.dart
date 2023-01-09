// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

Widget MyBottonSheet(
  getImageFromGallery,
  getImageFromCamera,
) {
  return Container(
    height: 100.0,
    // width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 20,
    ),
    child: Column(
      children: <Widget>[
        Text(
          "choose profile photo",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton.icon(
                onPressed: getImageFromCamera,
                icon: Icon(Icons.camera),
                label: Text("camera")),
            ElevatedButton.icon(
                onPressed: getImageFromGallery,
                icon: Icon(Icons.image),
                label: Text("gallery"))
          ],
        )
      ],
    ),
  );
}
