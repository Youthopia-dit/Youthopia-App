import 'package:flutter/material.dart';
import 'package:youthopia/Screens/signup2_screen.dart';
import 'package:youthopia/screens/navigation_screen.dart';
import 'package:youthopia/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SignUpScreen2());
  }
}
