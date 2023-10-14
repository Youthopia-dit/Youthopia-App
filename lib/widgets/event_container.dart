import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/black_container.dart';

import '../utils/colors.dart';

class EventContainer extends StatelessWidget {
  const EventContainer(
      {super.key,
      required this.nameOfEvent,
      required this.time,
      required this.venue});
  final String nameOfEvent;
  final String time;
  final String venue;
  @override
  Widget build(BuildContext context) {
    return BlackContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameOfEvent,
                style: const TextStyle(
                    fontSize: 18,
                    color: CustomColors.white,
                    fontWeight: FontWeight.bold),
              ).paddingForOnly(top: 15),
              Text(
                "Time: $time",
                style: const TextStyle(fontSize: 18, color: CustomColors.Grey1),
              ).paddingForOnly(top: 5, left: 5),
              Text(
                "Venue: $venue",
                style: const TextStyle(
                    fontSize: 18,
                    // textAlign:TextAlign.left,
                    color: CustomColors.Grey1),
              ).paddingForOnly(left: 5),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'Assets/fake_image.png',
              alignment: Alignment.center,
              height: 100,
              width: 150,
              fit: BoxFit.cover,
            ),
          ).paddingForAll(4)
        ],
      ).paddingForAll(10),
    );
  }
}
