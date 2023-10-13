import 'package:flutter/material.dart';

class SponserImageWidget extends StatelessWidget {
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
