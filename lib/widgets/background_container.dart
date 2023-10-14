import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: const AssetImage('Assets/background_image.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                CustomColors.black.withOpacity(.5), BlendMode.darken)),
      ),
      child: child,
    );
  }
}
