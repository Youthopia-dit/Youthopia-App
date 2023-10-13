import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import '../utils/colors.dart';

class EventContainer extends StatelessWidget {
  const EventContainer({super.key,required this.nameOfEvent,required this.time,required this.venue});
final String nameOfEvent;
final String time;
final String venue;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        decoration: BoxDecoration(
            color: CustomColors.Black40,
            // height: 110,
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //text
                Text(
                  nameOfEvent,
                  style: TextStyle(
                      fontSize: 25, color: Colors.white),
                ),
                Text(
                  "Time:${time}",
                  style: TextStyle(
                      fontSize: 18,
                      color: CustomColors.Grey1),
                ),
                Text(
                  "Venue:${venue}",
                  style: TextStyle(
                      fontSize: 18,
                      // textAlign:TextAlign.left,
                      color: CustomColors.Grey1),
                ),
              ],
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child:Image.asset(
                    'Assets/fake_image.png',
                    alignment: Alignment.center,
                    height: 80,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ).paddingForAll(10.0))
        .paddingForAll(10.0);
  }
}
