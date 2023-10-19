import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/form_input_widget.dart';
import 'package:youthopia/widgets/star_container.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';
import '../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

   void initState() {
    super.initState();
  }

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
                        validation: (value) => (email.isEmpty ||
                            !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                .hasMatch(email)),
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
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print(password);
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
          Image.asset('Assets/youthopia_white_flower.png')
              .paddingForOnly(top: 20)
        ],
      ),
    ));
  }
}
