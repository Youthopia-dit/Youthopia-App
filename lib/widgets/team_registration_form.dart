import 'package:flutter/material.dart';
import 'package:youthopia/data/models/event_model.dart';
import 'package:youthopia/data/shared_preferences.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/form_input_widget.dart';

import '../data/data_instance.dart';
import '../data/models/request_status.dart';
import '../utils/snackbar.dart';

class TeamRegForm extends StatefulWidget {
  const TeamRegForm({super.key, required this.details});
  final EventDetails details;
  @override
  State<TeamRegForm> createState() => _TeamRegFormState();
}

class _TeamRegFormState extends State<TeamRegForm> {
  String teamName = '';
  String id = '';
  int teamSize = 1;
  String phone = '';
  late int min;
  late int max;
  late List<String> members;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    max = widget.details.participantMax;
    min = widget.details.participantMin;
    teamSize = min;
    members = List.generate(max, (index) => '');
    id = Data.user.participantIdentityNumber;
    phone = Data.user.phonenumber;
    super.initState();
  }
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
                  validation: (value) => value.isEmpty,
                  errorText: 'Team Name cannot be empty',
                  keyboard: TextInputType.text)
              .paddingForOnly(bottom: 20),
          FormInputWidget(
                  fieldName: 'Leader\'s ID',
                  initial: id,
                  disabled: true,
                  onChanged: (value) {
                    id = value;
                  },
                  validation: (value) => value.isEmpty,
                  errorText: 'ID cannot be empty',
                  keyboard: TextInputType.number)
              .paddingForOnly(bottom: 20),
          FormInputWidget(
              fieldName: 'Leader\'s Phone Number',
              initial: phone,
              disabled: true,
              onChanged: (value) {
                phone = value;
              },
              validation: (value) => value.length != 10,
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
                    if (teamSize > min) {
                      setState(() {
                        teamSize = teamSize - 1;
                      });
                    }
                  }),
              CustomBox(text: teamSize.toString()),
              CustomBox(
                text: '+',
                onPressed: () {
                  if (teamSize < max) {
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
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                print(teamName);
                List<String> M = [];
                for(String mem in members) {
                  if(mem != '') {
                    M.add(mem);
                  }
                }
                Auth auth = Auth();
                final response = await auth.registerEvent(name: teamName, members: M, phone: phone, eventId: widget.details.eventId);
                print('Submitted');
                if(response.status == RequestStatus.FAILURE) {
                  ShowSnackBar.snack(context, title: 'Failure', message: 'Event Registration Failure', type: 'failure');
                } else {
                  ShowSnackBar.snack(context, title: 'Success', message: 'Registration Success', type: 'success');
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
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
