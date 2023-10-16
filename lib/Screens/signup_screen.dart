import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/form_input_widget.dart';
import 'package:youthopia/widgets/star_container.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';

import '../widgets/sign_up_heading.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();

  String name = '';

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
              const SignupHeading(
                index: 1,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormInputWidget(
                        fieldName: 'Name',
                        onChanged: (value) {
                          name = value;
                        },
                        validation: (value) => (name.isEmpty ||
                            !RegExp(r'^[A-Za-z ]+$').hasMatch(name)),
                        errorText: 'Enter Valid Name',
                        keyboard: TextInputType.text,
                      ).paddingForOnly(bottom: 30),
                      OutlinedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print(name);
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
          Image.asset('Assets/youthopia_white_flower.png').paddingForOnly(top: 20)
        ],
      ),
    ));
  }
}
