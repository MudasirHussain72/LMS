import 'package:flutter/material.dart';

class ProfileUiTopRight220 extends StatelessWidget {
  const ProfileUiTopRight220({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Container(
          height: 180,
          width: 180,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/ui_images/topr.png"))),
        ),
      ),
    );
  }
}

class ProfileUiTopleft220 extends StatelessWidget {
  const ProfileUiTopleft220({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 190.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/ui_images/8.png"))),
        ),
      ),
    );
  }
}

class ProfileUibottom220 extends StatelessWidget {
  const ProfileUibottom220({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          height: 150,
          width: 150,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/ui_images/7.png"))),
        ),
      ),
    );
  }
}
