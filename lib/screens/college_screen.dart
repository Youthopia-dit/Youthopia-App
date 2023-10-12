    import 'package:flutter/material.dart';
    import 'package:youthopia/utils/colors.dart';
    import 'package:youthopia/utils/widget_extensions.dart';

    class CollegeScreen extends StatelessWidget {
      const CollegeScreen({super.key});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/image 89.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset('Assets/naac.png'),
                    Image.asset('Assets/DIT LOGO WHITE.png'),
                    Image.asset('Assets/25_years_logo.png'),
                  ]).paddingForOnly(top: 10),
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: <Widget>[
              //       Image.asset('Assets/Group 6623.png'),
              //     ]).paddingForOnly(top: 50),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('Assets/youthopiastar.png'),
                  ]).paddingForOnly(top: 30),
              // Text(
              //   'Loading...',
              //
              //   style: TextStyle(fontWeight: FontWeight.bold,
              //   color: CustomColors.white,
              //   fontSize: 24),
              // ).paddingForOnly(top: 30),
            Text(
                'Who are you?',

                style: TextStyle(fontWeight: FontWeight.bold,
                color: CustomColors.white,
                fontSize: 24),
              ).paddingForOnly(top: 30),
              SizedBox(
                width: 300.0,
                height: 40.0,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),

                  // style:
                  //
                  // ButtonStyle(
                  //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //           RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(18.0),
                  //               side: BorderSide(color: Colors.white),
                  //           ),
                  //       ),
                  //   ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(
                        'DIT Student',
                    style: TextStyle(
                        color: CustomColors.black,
                        fontSize: 20)  ,),
                    Icon(Icons.arrow_right_alt_sharp,
                    color: CustomColors.black,)]
                ),),
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

                  // style:
                  //
                  // ButtonStyle(
                  //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //           RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(18.0),
                  //               side: BorderSide(color: Colors.white),
                  //           ),
                  //       ),
                  //   ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(
                    'Outsider',
                    style: TextStyle(
                        color: CustomColors.white,
                        fontSize: 20)  ,),
                    Icon(Icons.arrow_right_alt_sharp,
                      color: CustomColors.white,)]

                ),
                ),
              ).paddingForOnly(top: 20),

              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset('Assets/youthopia 2022 white small 1.png')
                          .paddingForOnly(bottom: 20))),
            ]),
          ),
        );
      }
    }
