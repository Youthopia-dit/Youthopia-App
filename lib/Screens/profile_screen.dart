import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youthopia/data/data_instance.dart';
import 'package:youthopia/data/shared_preferences.dart';
import 'package:youthopia/screens/college_screen.dart';
import 'package:youthopia/screens/ticket_list_screen.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_container.dart';
import 'package:youthopia/widgets/profile_details.dart';
import '../widgets/star_container.dart';
import '../widgets/youthopia_appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    print(Data.user.college);
    return BackgroundContainer(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const YouthopiaAppbar().paddingForOnly(top: 40),
            StarContainer(
              child: Column(
                children: [
                  Text(
                    Data.user.username,
                    style: const TextStyle(color: CustomColors.white, fontSize: 24),
                  ).paddingForOnly(top: 20),
                  Text(
                    Data.user.email,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(color: CustomColors.white, fontSize: 18),
                  ).paddingForOnly(top: 20, bottom: 20),
                  ProfileDetails(domain: "Mobile Number", value: Data.user.phonenumber),
                  ProfileDetails(domain: "year", value: Data.user.year),
                  ProfileDetails(domain: "College", value: Data.user.college),
                  SizedBox(
                    width: 180.0,
                    height: 40.0,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  const TicketListScreen()));
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: CustomColors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'MY TICKETS',
                              style: TextStyle(
                                  color: CustomColors.black, fontSize: 20),
                            ),
                          ]),
                    ),
                  ).paddingForOnly(top: 60),
                  SizedBox(
                    width: 150.0,
                    height: 40.0,
                    child: OutlinedButton(
                      onPressed: () async {
                        Data.token = '';
                        Auth auth = Auth();
                        await auth.logout();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CollegeScreen()),
                            (route) => false);
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                      child: const Row(
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
                  ).paddingForOnly(top: 20, bottom: 20),
                ],
              ).paddingWithSymmetry(horizontal: 18),
            ).paddingForOnly(
              bottom: 40,
            ),
          ],
        ),
      ),
    );
  }
}
