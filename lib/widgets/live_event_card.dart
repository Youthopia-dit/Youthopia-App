import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
          width: 300,
          child: CarouselSlider(
            items: imagePaths.map((imagePath) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: 150,
              enableInfiniteScroll: true,
              autoPlay: true,
            ),
          ),
        ),
        const Positioned(
          top: 5,
          left: 5,
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
        const Positioned(
          bottom: 24,
          left: 4,
          child: Row(
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
          ),
        ),
        const Positioned(
          bottom: 5,
          left: 5,
          child: Text(
            'Event Name',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Image.asset('Assets/Frame 6418.png'),
        ),
      ],
    );
  }
}
