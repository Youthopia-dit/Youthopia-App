import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';

import '../utils/colors.dart';

class AboutContainer extends StatelessWidget {
  const AboutContainer({super.key,required this.name, required this.year,required this.branch});
  final String name;
  final String year;
  final String branch;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: CustomColors.white,
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColors.white,
                    fontSize: 20),
              ),
              Text(
                '$branch - $year Year',
                style: const TextStyle(
                    color: CustomColors.Grey1, fontSize: 17),
              ),
            ]).paddingForOnly(left: 15, top: 10, bottom: 10)).paddingWithSymmetry(vertical: 5);
  }
}

class AboutHeading extends StatelessWidget {
  const AboutHeading({super.key, required this.title, required this.type});
  final String title;
 final bool type;
  @override
  Widget build(BuildContext context) {
    return Text(title,
        style : TextStyle(
            fontWeight: FontWeight.bold,
            color: CustomColors.white,
            fontSize: type==true ? 16 : 25 )
    ).paddingForAll(5);
  }
}

