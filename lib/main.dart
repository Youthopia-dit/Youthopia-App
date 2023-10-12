import 'package:flutter/material.dart';
import 'package:youthopia/screens/BottomNavbar.dart';
import 'package:youthopia/screens/splash_screen.dart';
import 'package:youthopia/screens/Registered_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Registered_event());
  }
}
