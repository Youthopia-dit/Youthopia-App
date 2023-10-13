import 'package:flutter/material.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/empty_events.dart';
class TestScreens extends StatelessWidget {
  const TestScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: NoEvents()));
  }
}
