import 'package:flutter/material.dart';

class ProfileUiTopRight220 extends StatelessWidget {
  const ProfileUiTopRight220({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/ui_images/topr.png"))),
      ),
    );
  }
}
