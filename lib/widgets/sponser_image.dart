// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SponserImageWidget extends StatelessWidget {
  String imagePath;
  SponserImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, top: 7),
          child: Image.asset('Assets/Rectangle 12376.png'),
        ),
      ],
    );
  }
}
