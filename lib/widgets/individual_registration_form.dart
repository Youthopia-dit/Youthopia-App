import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/form_input_widget.dart';

class IndRegForm extends StatefulWidget {
  const IndRegForm({super.key});

  @override
  State<IndRegForm> createState() => _IndRegFormState();
}

class _IndRegFormState extends State<IndRegForm> {
  String name = '';
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: [
          FormInputWidget(
                  fieldName: 'Name',
                  onChanged: (value) {
                    name = value;
                  },
                  validation: (value) => (value.isEmpty ||
                      !RegExp(r'^[A-Za-z ]+$').hasMatch(value)),
                  errorText: 'Enter Valid Name',
                  keyboard: TextInputType.text)
              .paddingForOnly(bottom: 20),
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
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Register',
                style: TextStyle(color: CustomColors.black, fontSize: 20),
              ).paddingForOnly(right: 10),
              const Icon(
                Icons.arrow_right_alt_sharp,
                color: CustomColors.black,
              )
            ]),
          ).paddingWithSymmetry(horizontal: 10, vertical: 20)
        ],
      ),
    );
  }
}
