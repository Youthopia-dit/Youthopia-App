import 'package:flutter/material.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/live_event_card.dart';
import 'package:youthopia/widgets/sponser_image.dart';

class LiveEventScreen extends StatelessWidget {
  LiveEventScreen({
    Key? key,
  }) : super(key: key);
  List<String> sponsorImages = [
    'Rectangle 12376.png',
    'Rectangle 12376.png',
    'Rectangle 12376.png',
    'Rectangle 12376.png',
    'Rectangle 12376.png',
    'Rectangle 12376.png',
    'Rectangle 12376.png',
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 41, top: 100),
                child: Image.asset('Assets/Rectangle 12375 (1).png'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 48),
                child: Text(
                  'LIVE EVENT',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const LiveEventCard(),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 48),
                child: Text(
                  'SPONSERS',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sponsorImages.length,
              itemBuilder: (context, index) {
                return SponserImageWidget(imagePath: sponsorImages[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
