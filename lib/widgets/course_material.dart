import 'package:flutter/material.dart';

class CourseMaterial extends StatelessWidget {
  var courseMaterialTextName;
  CourseMaterial({super.key, required this.courseMaterialTextName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 5,
            backgroundColor: Colors.grey[600],
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            courseMaterialTextName,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
