import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme
        )
      ),
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
