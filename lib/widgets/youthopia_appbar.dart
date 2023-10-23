import 'package:flutter/material.dart';
import 'package:youthopia/screens/about_us_screen.dart';
import 'package:youthopia/utils/widget_extensions.dart';

class YouthopiaAppbar extends StatelessWidget {
  const YouthopiaAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUsScreen()));
        },
        child: Image.asset(
          'Assets/youthopia_logo.png',
          width: 250,
        ),
      ),
    );
  }
}
