import 'package:flutter/material.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
        ),
        Container(
                child: Image.asset('Assets/Group 6760.png')
                    .paddingForOnly(top: 20))
            .paddingForOnly(bottom: 10),
        Container(
          width: 380.0,
          height: 400.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: Colors.black.withOpacity(0.8)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Column(children: <Widget>[
                      Text(
                        'Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomColors.white,
                            fontSize: 24),
                      ),
                      Text(
                        'Brach and year',
                        style:
                            TextStyle(color: CustomColors.Grey1, fontSize: 14),
                      ),
                    ]))
              ]).paddingForOnly(left: 30),
        ),
      ]),
    );
  }
}
