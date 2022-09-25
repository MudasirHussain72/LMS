import 'package:flutter/material.dart';

class UserProfilePicture extends StatelessWidget {
  var picHeight;
  var picWidth;
  var imagePath;
  UserProfilePicture({
    super.key,
    required this.picHeight,
    required this.picWidth,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: picHeight,
      width: picWidth,
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
          image: DecorationImage(fit: BoxFit.cover, image: imagePath)),
    );
  }
}
