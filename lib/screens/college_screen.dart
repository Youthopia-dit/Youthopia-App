import 'package:flutter/material.dart';
import 'package:youthopia/screens/login_screen.dart';
import 'package:youthopia/screens/signup_screen.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/logo_widget.dart';

class CollegeScreen extends StatelessWidget {
  const CollegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: Column(children: <Widget>[
      const HorizontalLogo().paddingForOnly(top: 30),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('Assets/youthopiastar.png'),
          ]).paddingForOnly(top: 50),
      Expanded(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 300.0,
                    height: 40.0,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Log in to your Account',
                              style: TextStyle(
                                  color: CustomColors.black, fontSize: 20),
                            ).paddingForOnly(right: 10),
                            const Icon(
                              Icons.arrow_right_alt_sharp,
                              color: CustomColors.black,
                            )
                          ]),
                    ),
                  ).paddingForOnly(top: 20),
                  SizedBox(
                    width: 300.0,
                    height: 40.0,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: CustomColors.white, fontSize: 20),
                            ).paddingForOnly(right: 10),
                            const Icon(
                              Icons.arrow_right_alt_sharp,
                              color: CustomColors.white,
                            )
                          ]),
                    ),
                  ).paddingForOnly(top: 20, bottom: 50),
                  Image.asset('Assets/youthopia_white_flower.png')
                      .paddingForOnly(bottom: 20),
                ],
              ))),
    ]));
  }
}
