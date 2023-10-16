import 'package:flutter/material.dart';
import 'package:youthopia/Screens/login_screen.dart';
import 'package:youthopia/screens/college_screen.dart';
import 'package:youthopia/screens/signup2_screen.dart';
import 'Screens/signup_screen.dart';
import 'package:youthopia/Screens/form_screen.dart';
import 'Screens/about_us_screen.dart';

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
