import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';

class BackgroundScaffold extends StatelessWidget {
  const BackgroundScaffold({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('Assets/background_image.png'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    CustomColors.black.withOpacity(.5), BlendMode.darken)),
          ),
        child: child,
      ),
    );
  }
}
