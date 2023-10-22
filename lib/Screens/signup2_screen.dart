import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:youthopia/data/backend.dart';
import 'package:youthopia/data/models/request_status.dart';
import 'package:youthopia/data/shared_preferences.dart';
import 'package:youthopia/screens/navigation_screen.dart';
import 'package:youthopia/utils/common_utils.dart';
import 'package:youthopia/utils/snackbar.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/sign_up_heading.dart';
import 'package:youthopia/widgets/star_container.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';

import '../data/data_instance.dart';
import '../utils/colors.dart';
import '../widgets/form_input_widget.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2(
      {super.key,
      required this.name,
      required this.phone,
      required this.password,
      required this.email});
  final String name;
  final String email;
  final String phone;
  final String password;
  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final formKey = GlobalKey<FormState>();

  String colName = '';
  String year = '';
  String identity = '';
  String branch = '';
  bool collegeDit = false;
  bool loading = false;
  String id = '';
  File? image;
  late final bytes;

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        resize: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const YouthopiaAppbar().paddingForOnly(top: 20),
              StarContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SignupHeading(
                    index: 2,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'DIT University',
                                style: TextStyle(
                                    color: CustomColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Checkbox(
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (!states
                                        .contains(MaterialState.selected)) {
                                      return CustomColors.white
                                          .withOpacity(.32);
                                    }
                                    return CustomColors.glowBlue;
                                  }),
                                  value: collegeDit,
                                  onChanged: (value) {
                                    setState(() {
                                      collegeDit = !collegeDit;
                                    });
                                  }),
                            ],
                          ),
                          (collegeDit)
                              ? const SizedBox()
                              : FormInputWidget(
                                  fieldName: 'College Name',
                                  onChanged: (value) {
                                    colName = value;
                                  },
                                  validation: (value) => (value.isEmpty),
                                  errorText: 'Enter Valid College Name',
                                  keyboard: TextInputType.text,
                                ).paddingForOnly(bottom: 30),
                          FormInputWidget(
                            fieldName: 'Year',
                            onChanged: (value) {
                              year = value;
                            },
                            validation: (value) => (year.isEmpty ||
                                !RegExp(r'^[1-5]+$').hasMatch(year)),
                            errorText: 'Enter a Valid Year',
                            keyboard: TextInputType.number,
                          ).paddingForOnly(bottom: 30),
                          FormInputWidget(
                            suffix: (collegeDit)
                                ? SizedBox()
                                : IconButton(
                                    onPressed: () async {
                                      try {
                                        final image = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery);
                                        if (image == null) {
                                          return;
                                        }
                                        setState(() {
                                          this.image = File(image.path);
                                        });
                                        bytes = await image.readAsBytes();
                                      } on PlatformException {
                                        ShowSnackBar.snack(context,
                                            title: 'An Error Occured!!',
                                            message:
                                                'Insufficient Permissions!',
                                            type: 'failure');
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: CustomColors.white,
                                    )),
                            fieldName:
                                (collegeDit) ? 'Student ID' : 'Aadhar Number',
                            onChanged: (value) {
                              identity = value;
                            },
                            validation: (value) {
                              if (collegeDit) {
                                if (value.length != 10) {
                                  return true;
                                } else {
                                  return false;
                                }
                              } else {
                                if (value.length != 12) {
                                  return true;
                                } else {
                                  return false;
                                }
                              }
                            },
                            errorText: 'Enter a Valid ID',
                            keyboard: TextInputType.number,
                          ),
                          (image != null)
                              ? Text(
                                  image!.path,
                                  style: TextStyle(color: CustomColors.white),
                                )
                              : SizedBox(),
                          FormInputWidget(
                            fieldName: 'Branch',
                            onChanged: (value) {
                              branch = value;
                            },
                            validation: (value) => (value.isEmpty),
                            errorText: 'Enter a Valid Branch',
                            keyboard: TextInputType.text,
                          ).paddingForOnly(top: 30, bottom: 30),
                          OutlinedButton(
                            onPressed: () async {
                              if (!loading) {
                                if (!collegeDit && image == null) {
                                  ShowSnackBar.snack(context,
                                      title: 'Error',
                                      message: 'Upload Aadhar Photo',
                                      type: 'failure');
                                }
                                setState(() {
                                  loading = true;
                                });
                                if (formKey.currentState!.validate()) {
                                  Auth auth = Auth();
                                  if(collegeDit) {
                                    colName = 'DIT University';
                                  }
                                  final response = await auth.signup(
                                      name: widget.name,
                                      email: widget.email,
                                      password: widget.password,
                                      phone: widget.phone,
                                      college: colName,
                                      year: year,
                                      identity: identity,
                                      image: image);
                                  if (response.status ==
                                      RequestStatus.SUCCESS) {
                                    Data.user = response.body!;
                                    ShowSnackBar.snack(context,
                                        title: 'Sign Up Success',
                                        message: 'Successfully Registered',
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
                                }
                                setState(() {
                                  loading = false;
                                });
                              }
                            },
                            style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                )),
                            child: (loading) ? LoadingAnimationWidget.staggeredDotsWave(
                              color: CustomColors.black,
                              size: 20,
                            ) : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Next',
                                    style: TextStyle(
                                        color: CustomColors.black,
                                        fontSize: 20),
                                  ).paddingForOnly(right: 10),
                                  const Icon(
                                    Icons.arrow_right_alt_sharp,
                                    color: CustomColors.black,
                                  )
                                ]),
                          ).wrapCenter().paddingWithSymmetry(horizontal: 10, vertical: 20)
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
