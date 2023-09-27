import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/image 89.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
            children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('Assets/naac.png'),
                Image.asset('Assets/DIT LOGO WHITE.png'),
                Image.asset('Assets/25_years_logo.png'),
              ]).paddingForOnly(top: 30),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('Assets/Group 6623.png'),
              ]).paddingForOnly(top: 50),
        ]),
      ),
    );
  }
}
