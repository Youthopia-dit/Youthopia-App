import 'package:flutter/material.dart';
import 'package:youthopia/Screens/signup2_screen.dart';
import 'package:youthopia/screens/navigation_screen.dart';
import 'package:youthopia/screens/signup2_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:youthopia/screens/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
