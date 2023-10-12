import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';

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
              height: 500,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  color: Colors.black.withOpacity(0.8)),
              child: Form(
                child: Column(
                  children: [
                    Text('Email'),
                    TextFormField(),
                    Text('Password'),
                    TextFormField(),
                    TextButton(onPressed: () {}, child: Text('Forgot Password?')),
                    TextButton(onPressed: () {}, child: Text('Login'))
                  ],
                ),
              ),
            ).paddingForOnly(top: 15, right: 15, left: 15),
            Positioned(
                top: 0,
                right: 0,
                child: Image.asset(
                  'Assets/Group 6752.png',
                  height: 50,
                  width: 50,
                )),
          ],
        )
      ],
    ));
  }
}
