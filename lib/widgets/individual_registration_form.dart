import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:youthopia/data/data_instance.dart';
import 'package:youthopia/data/models/event_model.dart';
import 'package:youthopia/data/models/request_status.dart';
import 'package:youthopia/data/shared_preferences.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/snackbar.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/form_input_widget.dart';

class IndRegForm extends StatefulWidget {
  const IndRegForm({super.key, required this.event});
  final EventDetails event;
  @override
  State<IndRegForm> createState() => _IndRegFormState();
}

class _IndRegFormState extends State<IndRegForm> {
  String name = '';
  String id = '';
  String phone = '';
  bool loading = false;
  @override
  void initState() {
    id = Data.user.participantIdentityNumber;
    phone = Data.user.phonenumber;
    name = Data.user.username;
    super.initState();
  }
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
              initial: name,
              disabled: true,
                  validation: (value) => (value.isEmpty ||
                      !RegExp(r'^[A-Za-z ]+$').hasMatch(value)),
                  errorText: 'Enter Valid Name',
                  keyboard: TextInputType.text)
              .paddingForOnly(bottom: 20),
          FormInputWidget(
                  fieldName: 'ID Number',
                  onChanged: (value) {
                    id = value;
                  },
              initial: id,
              disabled: true,
                  validation: (value) => value.isEmpty,
                  errorText: 'ID cannot be empty',
                  keyboard: TextInputType.number)
              .paddingForOnly(bottom: 20),
          FormInputWidget(
              fieldName: 'Phone Number',
              onChanged: (value) {
                id = value;
              },
              initial: phone,
              disabled: true,
              validation: (value) => value.isEmpty,
              errorText: 'ID cannot be empty',
              keyboard: TextInputType.number)
              .paddingForOnly(bottom: 20),
          OutlinedButton(
            onPressed: () async {
              if(loading) {
                return;
              }
              setState(() {
                loading = true;
              });
              if (formKey.currentState!.validate()) {
                print(name);
                Auth auth = Auth();
                final response = await auth.registerEvent(name: name, members: [], phone: phone, eventId: widget.event.eventId);
                print('Submitted');
                if(response.status == RequestStatus.FAILURE) {
                  ShowSnackBar.snack(context, title: 'Failure', message: 'Event Registration Failure', type: 'failure');
                } else {
                  ShowSnackBar.snack(context, title: 'Success', message: 'Registration Success', type: 'success');
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              }
              setState(() {
                loading = false;
              });
            },
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
            child: (loading) ? LoadingAnimationWidget.staggeredDotsWave(
              color: CustomColors.black,
              size: 20,
            ) : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
