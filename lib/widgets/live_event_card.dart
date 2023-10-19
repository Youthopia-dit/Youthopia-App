import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';

class LiveEventCard extends StatelessWidget {
  LiveEventCard({
    super.key,
  });
  final List<String> imagePaths = [
    'Assets/Rectangle 1521 (1).png',
    'Assets/Rectangle 1521 (1).png',
    'Assets/Rectangle 1521 (1).png',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 400,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'Assets/fake_image.png',
              alignment: Alignment.center,
              fit: BoxFit.cover,
              color: CustomColors.black,
            ),
          ),
        ),
        const Positioned(
          top: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.white,
                  ),
                  Text(
                    '12:00 AM',
                    style: TextStyle(color: Colors.white),
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
              const Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Date',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ).paddingForOnly(bottom: 10),
              const Text(
                'Event Name',
                style: TextStyle(color: Colors.white),
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
