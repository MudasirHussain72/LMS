import 'package:flutter/material.dart';

//blue
class UIpathLeft219 extends StatelessWidget {
  const UIpathLeft219({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          height: 100,
          width: 80,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/ui_images/Path_219.png"))),
        ),
      ),
    );
  }
}

//yellow
class UIpathLeft220 extends StatelessWidget {
  const UIpathLeft220({super.key});

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
                image: AssetImage("assets/ui_images/Path_220.png"))),
      ),
    );
  }
}

// leftBlackCircle
class UIpathLeftCircle extends StatelessWidget {
  const UIpathLeftCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          height: 59,
          width: 25,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/ui_images/Mask_Group_2.png"))),
        ),
      ),
    );
  }
}
