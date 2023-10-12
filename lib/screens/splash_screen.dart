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
              image: AssetImage('Assets/background_image.png'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  CustomColors.black.withOpacity(.5), BlendMode.darken)),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('Assets/naac.png'),
                    Image.asset('Assets/DIT LOGO WHITE.png'),
                    Image.asset('Assets/25_years_logo.png'),
                  ]).paddingForOnly(top: 30),
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('Assets/Group 6623.png'),
                      ]).paddingForOnly(top: 50),
                  const Text(
                    'Loading...',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.white,
                        fontSize: 24),
                  ).paddingForOnly(top: 30),
                ],
              ),
              Image.asset('Assets/youthopia_white_flower.png')
                  .paddingForOnly(bottom: 30)
            ]),
      ),
    );
  }
}
