import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';

class StarContainer extends StatelessWidget {
  const StarContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: CustomColors.blackTrans,
              borderRadius: BorderRadius.circular(25)),
          child: child,
        ).paddingForOnly(top: 24, right: 16, left: 16),
        Positioned(top: 0, right: 0, child: Image.asset('Assets/star.png', width: 60,)),
      ],
    );
  }
}
