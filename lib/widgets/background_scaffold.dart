import 'package:flutter/material.dart';
import 'package:youthopia/widgets/background_container.dart';

class BackgroundScaffold extends StatelessWidget {
  const BackgroundScaffold({super.key, required this.child, this.resize = false});
  final Widget child;
  final bool resize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: resize,
        body: BackgroundContainer(child: child));
  }
}
