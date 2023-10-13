import 'package:flutter/material.dart';
import 'package:youthopia/widgets/background_scaffold.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(child: Placeholder());
  }
}
