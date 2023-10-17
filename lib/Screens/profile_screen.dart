import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_container.dart';
import 'package:youthopia/widgets/profile_details.dart';
import '../widgets/background_scaffold.dart';
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
    // return const Placeholder();
    return BackgroundContainer(
      child:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            YouthopiaAppbar().paddingForOnly(top:40),

            StarContainer(child: Column(
              children: [
                Text("Abhishek",style: TextStyle(color: CustomColors.white,
                fontSize: 30),).paddingForOnly(top:20),

                Text("Abhishek123@gmail.com",style: TextStyle(color: CustomColors.white,
                    fontSize: 20),).paddingForOnly(top:20,bottom: 20),


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
                ).paddingForOnly(top: 60, left: 20),

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
                ).paddingForOnly(top: 20,bottom: 20),


              ],

            ).paddingWithSymmetry(horizontal: 18),).paddingForOnly(bottom: 40,),
          ],
        ),
      ) ,




    );
  }
}
