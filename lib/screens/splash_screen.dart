import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
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
        child: Column(children: <Widget>[
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
          Text(
            'Loading...',

            style: TextStyle(fontWeight: FontWeight.bold,
            color: CustomColors.white,
            fontSize: 24),
          ).paddingForOnly(top: 30),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('Assets/youthopia 2022 white small 1.png')
                      .paddingForOnly(bottom: 30))),
        ]),
      ),
    );
  }
}
