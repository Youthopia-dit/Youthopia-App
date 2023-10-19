import 'dart:ffi';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:youthopia/data/shared_preferences.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/form_input_widget.dart';
import 'package:youthopia/widgets/star_container.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';

import '../data/data_instance.dart';
import '../data/models/request_status.dart';
import '../utils/colors.dart';
import '../utils/snackbar.dart';
import 'navigation_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();


  String email = '';
  String password = '';

  bool isPasswordValid(String password) {
    int minLength = 6;
    return password.length >= minLength;
  }


  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: SingleChildScrollView(
      child: Column(
        children: [
          const YouthopiaAppbar().paddingForOnly(top: 20),
          StarContainer(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      FormInputWidget(
                        fieldName: 'Email',
                        onChanged: (value) {
                          email = value;
                        },
                        validation: (value) => (!EmailValidator.validate(email) ||
                            email.isEmpty),
                        errorText: 'Enter Valid email',
                        keyboard: TextInputType.text,
                      ).paddingForOnly(bottom: 30),
                      FormInputWidget(
                        fieldName: 'Password',
                        onChanged: (value) {
                          password = value;
                        },
                        validation: (value) =>
                            (password.isEmpty || !isPasswordValid(password)),
                        errorText: 'Enter password',
                        keyboard: TextInputType.text,
                      ).paddingForOnly(bottom: 30),
                      OutlinedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            print(password);
                            Auth auth = Auth();
                            final response = await auth.login(email : email, password: password);
                            if (response.status ==
                                RequestStatus.SUCCESS) {
                              Data.user = response.body!;
                              ShowSnackBar.snack(context,
                                  title: 'Log in Success',
                                  message: '',
                                  type: 'success');
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BottomNavbar()),
                                      (route) => false);
                            } else {
                              ShowSnackBar.snack(context,
                                  title: 'An Error Occured',
                                  message: response.message!,
                                  type: 'failure');
                            }
                            print('Submitted');
                          }
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
                                'Next',
                                style: TextStyle(
                                    color: CustomColors.black, fontSize: 20),
                              ).paddingForOnly(right: 10),
                              const Icon(
                                Icons.arrow_right_alt_sharp,
                                color: CustomColors.black,
                              )
                            ]),
                      ).paddingWithSymmetry(horizontal: 10, vertical: 20)
                    ],
                  )).paddingWithSymmetry(horizontal: 20)
            ],
          )).paddingWithSymmetry(horizontal: 10),
          Container(
            child: Image.asset('Assets/youthopia_white_flower.png')
                .paddingForOnly(top: 20),
          )
        ],
      ),
    ));
  }
}
