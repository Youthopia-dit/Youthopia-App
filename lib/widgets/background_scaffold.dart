import 'package:flutter/material.dart';
import 'package:youthopia/widgets/background_container.dart';

class BackgroundScaffold extends StatelessWidget {
  const BackgroundScaffold({super.key, required this.child, this.appBar});
  final Widget child;
  final SliverAppBar? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BackgroundContainer(child: child));
  }
}
