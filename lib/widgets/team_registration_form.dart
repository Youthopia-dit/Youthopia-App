import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/form_input_widget.dart';

class TeamRegForm extends StatefulWidget {
  const TeamRegForm({super.key});

  @override
  State<TeamRegForm> createState() => _TeamRegFormState();
}

class _TeamRegFormState extends State<TeamRegForm> {
  String teamName = '';
  String id = '';
  int teamSize = 1;
  List<String> members = List.generate(10, (index) => '');
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          FormInputWidget(
                  fieldName: 'Team Name',
                  onChanged: (value) {
                    teamName = value;
                  },
                  validation: (value) => value.isNotEmpty,
                  errorText: 'Team Name cannot be empty',
                  keyboard: TextInputType.text)
              .paddingForOnly(bottom: 20),
          FormInputWidget(
                  fieldName: 'Leader\'s ID',
                  onChanged: (value) {
                    id = value;
                  },
                  validation: (value) => value.isNotEmpty,
                  errorText: 'ID cannot be empty',
                  keyboard: TextInputType.number)
              .paddingForOnly(bottom: 20),
          const Text(
            'Team Size',
            style: TextStyle(
                color: CustomColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ).paddingForOnly(bottom: 10),
          Row(
            children: [
              CustomBox(
                  text: '-',
                  onPressed: () {
                    if (teamSize > 1) {
                      setState(() {
                        teamSize = teamSize - 1;
                      });
                    }
                  }),
              CustomBox(text: teamSize.toString()),
              CustomBox(
                text: '+',
                onPressed: () {
                  if (teamSize < 5) {
                    setState(() {
                      teamSize = teamSize + 1;
                    });
                  }
                },
              )
            ],
          ).paddingForOnly(bottom: 20),
          ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: teamSize - 1,
              itemBuilder: (context, index) {
                return FormInputWidget(
                        fieldName: 'Team Member ${index + 1}',
                        onChanged: (value) {
                          members[index] = value;
                        },
                        validation: (value) => (value.isEmpty ||
                            !RegExp(r'^[A-Za-z ]+$').hasMatch(value)),
                        errorText: 'Enter Valid Name',
                        keyboard: TextInputType.text)
                    .paddingForOnly(bottom: 20);
              }),
          OutlinedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
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
                'Next',
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

class CustomBox extends StatelessWidget {
  const CustomBox({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.transparent : Colors.white10,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 15, color: CustomColors.white),
          ),
        ));
  }
}
