import 'package:flutter/material.dart';

class LiveEventCard extends StatelessWidget {
  const LiveEventCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 150,
          child: Image.asset(
            'Assets/Rectangle 1521 (1).png',
            fit: BoxFit.cover,
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
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                  ),
                  Text(
                    'Date',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
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
