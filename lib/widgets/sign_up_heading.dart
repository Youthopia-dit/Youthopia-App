import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';

import '../utils/colors.dart';

class SignupHeading extends StatelessWidget {
  const SignupHeading({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'Sign Up', // Added "Sign Up" text
          style: TextStyle(
            fontSize: 20.0, // Changed font size
            color: Colors.white, // Changed text color to white
          ),
        ).wrapCenter(),
        Column(
          children: [
            Image.asset(
              (index == 1)
                  ? 'Assets/signup_image_1.png'
                  : 'Assets/signup_image_2.png',
              width: 200,
              fit: BoxFit.cover,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Personal',
                  style:
                      TextStyle(color: CustomColors.white), // Text color white
                ),
                Text(
                  'University',
                  style:
                      TextStyle(color: CustomColors.white), // Text color white
                ),
              ],
            ).paddingWithSymmetry(horizontal: 16, vertical: 16),
          ],
        ).paddingWithSymmetry(horizontal: 20, vertical: 10),
      ],
    ).paddingForOnly(top: 30);
  }
}
