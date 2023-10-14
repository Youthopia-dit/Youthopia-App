import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_container.dart';
import 'package:youthopia/widgets/profile_details.dart';

import '../widgets/background_scaffold.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return BackgroundContainer(
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
          Stack(children: [
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CustomColors.blackTrans,
              ),
            ).paddingForOnly(top: 60),
            Positioned(
              top: 0,
              left: 110,
              right: 110,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(220),
                    child: Image.asset(
                      'Assets/fake_image.png',
                      alignment: Alignment.center,
                      height: 130,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    "Abhishek",
                    style: TextStyle(fontSize: 25, color: CustomColors.white),
                  ).paddingForOnly(top: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      "abhishek@gmail.com",
                      style: TextStyle(fontSize: 18, color: CustomColors.white),
                    ).paddingForOnly(top: 10),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 250,
              child: Column(
                children: [
                  ProfileDetails(domain: "Mobile Number", value: "8829442726"),
                  ProfileDetails(domain: "Branch", value: "B.Tech"),
                  ProfileDetails(domain: "year", value: "3 year"),
                  ProfileDetails(domain: "College", value: "Dit"),
                  SizedBox(
                    width: 180.0,
                    height: 40.0,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          backgroundColor: CustomColors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'MY TICKETS',
                              style: TextStyle(
                                  color: CustomColors.black, fontSize: 20),
                            ),
                          ]),
                    ),
                  ).paddingForOnly(top: 20, left: 20),
                  SizedBox(
                    width: 150.0,
                    height: 40.0,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.login_outlined,
                              color: CustomColors.black,
                            ),
                            Text(
                              'Log Out',
                              style: TextStyle(
                                  color: CustomColors.black, fontSize: 20),
                            ),
                          ]),
                    ),
                  ).paddingForOnly(top: 20),
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }
}
