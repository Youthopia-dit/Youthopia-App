import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';

//import
class InkWellRectangle extends StatelessWidget {
  final Widget child;

  InkWellRectangle({required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle tap event
      },
      child: Container(
        width: 308.0,
        height: 570.0,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8), // Black color with 80% opacity
          borderRadius: BorderRadius.circular(25.0), // Rounded corners
        ),
        child: child, // Add the provided child widget here
      ),
    );
  }
}
