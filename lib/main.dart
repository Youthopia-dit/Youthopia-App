import 'package:flutter/material.dart';
import 'package:youthopia/Screens/signup_screen.dart';
import 'package:youthopia/screens/BottomNavbar.dart';
import 'package:youthopia/screens/Event_info.dart';
import 'package:youthopia/screens/profile.dart';
import 'package:youthopia/screens/aboutus.dart';
import 'package:youthopia/screens/splash_screen.dart';
import 'package:youthopia/screens/Registered_event.dart';
import 'package:youthopia/screens/login_screen.dart';
import 'package:youthopia/screens/college_screen.dart';
import 'package:youthopia/screens/test_screen.dart';
import 'package:youthopia/screens/ticket_screen.dart';
import 'package:youthopia/widgets/empty_events.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: BottomNavbar());
  }
}
