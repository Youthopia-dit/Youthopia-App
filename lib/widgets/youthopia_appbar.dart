import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';

class YouthopiaAppbar extends StatelessWidget {
  const YouthopiaAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'Assets/youthopia_logo.png',
          width: 250,
        ).paddingForOnly(left: 30, bottom: 10)
      ],
    );
  }
}
