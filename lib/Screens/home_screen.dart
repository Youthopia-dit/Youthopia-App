import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_container.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/live_event_card.dart';
import 'package:youthopia/widgets/sponser_image.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  List<String> sponsorImages = [
    'Rectangle 12376.png',
    'Rectangle 12376.png',
    'Rectangle 12376.png',
    'Rectangle 12376.png',
    'Rectangle 12376.png',
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YouthopiaAppbar().paddingForOnly(top: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'Assets/fake_image.png',
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'LIVE EVENTS',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          LiveEventCard(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'SPONSORS',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Image.asset('Assets/Rectangle 12376.png');
                }),
          )
        ],
      ).paddingWithSymmetry(horizontal: 20),
    );
  }
}
