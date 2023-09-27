import 'package:flutter/material.dart';

class LiveEventScreen extends StatelessWidget {
  const LiveEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('Assets/image 89.png'),
          ),
        ),
      ),
    );
  }
}
