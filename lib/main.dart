import 'package:flutter/material.dart';
import 'package:youthopia/screens/Live_Event_Screen.dart';
import 'package:youthopia/screens/login_screen.dart';
import 'package:youthopia/screens/college_screen.dart';
import 'package:youthopia/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LiveEventScreen());
  }
}
