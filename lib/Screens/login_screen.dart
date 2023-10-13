import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import '../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 80,
        ),
        Image.asset(
          'Assets/youthopia_logo.png',
          width: 200,
          height: 65,
          fit: BoxFit.cover,
        ).paddingForOnly(bottom: 40),
        Stack(
          children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.black.withOpacity(0.8)),
              child: Form(
                child: Column(
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(color: CustomColors.white, fontSize: 20),
                    ).paddingForOnly(top: 20),
                    TextFormField(),
                    Text(
                      'Password',
                      style: TextStyle(color: CustomColors.white, fontSize: 20),
                    ).paddingForOnly(top: 20),
                    TextFormField(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: CustomColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200.0,
                      height: 40.0,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: CustomColors.black, fontSize: 20),
                        ),
                      ),
                    ).paddingForOnly(top: 20),
                  ],
                ),
              ),
            ).paddingForOnly(top: 15, right: 15, left: 15),
            Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'Assets/star.png',
                  height: 50,
                  width: 50,
                )),
          ],
        )
      ],
    ));
  }
}
