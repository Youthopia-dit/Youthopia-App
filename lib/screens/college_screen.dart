import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';

class CollegeScreen extends StatelessWidget {
  const CollegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
        child: Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        Image.asset('Assets/naac.png'),
        Image.asset('Assets/DIT LOGO WHITE.png'),
        Image.asset('Assets/25_years_logo.png'),
      ]).paddingForOnly(top: 10),

      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('Assets/youthopiastar.png'),
          ]).paddingForOnly(top: 30),

      Text(
        'Who are you?',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: CustomColors.white,
            fontSize: 24),
      ).paddingForOnly(top: 30),
      SizedBox(
        width: 300.0,
        height: 40.0,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              )),


          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'DITIAN',
              style: TextStyle(color: CustomColors.black, fontSize: 20),
            ),
            Icon(
              Icons.arrow_right_alt_sharp,
              color: CustomColors.black,
            )
          ]),
        ),
      ).paddingForOnly(top: 20),
      SizedBox(
        width: 300.0,
        height: 40.0,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
            side: BorderSide(color: CustomColors.black, width: 30.0),
            borderRadius: BorderRadius.circular(18.0),
          )),


          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Non DITIAN',
              style: TextStyle(color: CustomColors.white, fontSize: 20),
            ),
            Icon(
              Icons.arrow_right_alt_sharp,
              color: CustomColors.white,
            )
          ]),
        ),
      ).paddingForOnly(top: 20),

      Expanded(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('Assets/youthopia_white_flower.png')
                  .paddingForOnly(bottom: 20))),
    ]));
  }
}
