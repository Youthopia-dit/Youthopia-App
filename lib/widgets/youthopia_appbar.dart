import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';

class YouthopiaAppbar extends StatelessWidget {
  const YouthopiaAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Image.asset(
        'Assets/youthopia_logo.png',
        width: 250,
      ),
    );
  }
}
