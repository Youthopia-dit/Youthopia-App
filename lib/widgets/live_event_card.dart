import 'package:flutter/material.dart';
import 'package:youthopia/data/models/even
t_model.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/common_utils.dart';
import 'package:youthopia/utils/widget_extensions.dart';

import 'cached_image.dart';

class LiveEventCard extends StatelessWidget {
  const LiveEventCard({super.key, required this.eventDetails});

  final EventDetails eventDetails;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedImage(
           imageUrl: eventDetails.poster,
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: CustomColors.white,
                  ),
                  Text(
                    eventDetails.startTime,
                    style: const TextStyle(color: CustomColors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: CustomColors.white,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    CommonUtils.getDate(eventDetails.date),
                    style: const TextStyle(color: CustomColors.white),
                  ),
                ],
              ).paddingForOnly(bottom: 10),
              Text(
                eventDetails.eventName,
                style: const TextStyle(color: CustomColors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
                color: CustomColors.red,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8)),
            child: const Text(
              'LIVE',
              style: TextStyle(
                  color: CustomColors.white, fontWeight: FontWeight.bold),
            ).paddingWithSymmetry(horizontal: 8, vertical: 8),
          ),
        ),
      ],
    );
  }
}
