import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/about_container.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          YouthopiaAppbar().paddingForOnly(top: 50),
          Container(
                  child: Image.asset('Assets/Group 6760.png')
                      .paddingForOnly(top: 0))
              .paddingForOnly(bottom: 10),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Colors.black.withOpacity(0.8)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AboutHeading(
                    title: 'Conveners',
                    type: false,
                  ),
                  const AboutContainer(
                    name: 'pragati',
                    branch: 'btech cse',
                    year: '2nd',
                  ),
                  const AboutContainer(
                    name: 'vivan',
                    branch: 'btech cse',
                    year: '1nd',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AboutHeading(
                    title: 'Designer team',
                    type: false,
                  ),
                  const AboutContainer(
                    name: 'vijan',
                    branch: 'btech cse',
                    year: '3nd',
                  ),
                  const AboutContainer(
                    name: 'Garima',
                    branch: 'btech cse',
                    year: '2nd',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AboutHeading(
                    title: 'Design Team Members',
                    type: true,
                  ),
                  const AboutContainer(
                    name: 'vijan',
                    branch: 'btech cse',
                    year: '3nd',
                  ),
                  const AboutContainer(
                    name: 'Garima',
                    branch: 'btech cse',
                    year: '2nd',
                  ),
                  const AboutContainer(
                    name: 'raju',
                    branch: 'btech cse',
                    year: '3nd',
                  ),
                  const AboutContainer(
                    name: 'junkook',
                    branch: 'btech cse',
                    year: '2nd',
                  ),
                  Container(
                    width: 300.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: CustomColors.white,
                      ),
                    ),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: CustomColors.black, width: 30.0),
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                      child: const Text(
                        'Go Back to Login Page',
                        style: TextStyle(color: CustomColors.white, fontSize: 16),
                      ),
                    ),
                  ).paddingForOnly(top: 20),
                ]).paddingWithSymmetry(horizontal: 20),
          ),
        ]),
      ),
    );
  }
}
