import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';

class BlackContainer extends StatelessWidget {
  const BlackContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.black.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25)
      ),
      elevation: 8,
      child: child,
    );
  }
}
