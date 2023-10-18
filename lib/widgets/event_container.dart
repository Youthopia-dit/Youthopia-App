import 'package:flutter/material.dart';
import 'package:youthopia/data/models/event_model.dart';
import 'package:youthopia/screens/single_event_screen.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/black_container.dart';
import '../utils/colors.dart';

class EventContainer extends StatelessWidget {
  const EventContainer({super.key, required this.event});
  final EventDetails event;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                SingleEventScreen(eventDetails: event,)));
      },
      child: BlackContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.eventName,
                    style: const TextStyle(
                        fontSize: 18,
                        color: CustomColors.white,
                        fontWeight: FontWeight.bold),
                  ).paddingForOnly(top: 15),
                  Text(
                    "Time: ${event.endTime}",
                    style: const TextStyle(
                        fontSize: 18, color: CustomColors.Grey1),
                  ).paddingForOnly(top: 5, left: 5),
                  Text(
                    "Venue: ${event.venue}",
                    style: const TextStyle(
                        fontSize: 18,
                        // textAlign:TextAlign.left,
                        color: CustomColors.Grey1),
                  ).paddingForOnly(left: 5),
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  event.poster,
                  errorBuilder: (context, exception, stacktrace) {
                    return Image.asset(
                      'Assets/fake_image.png',
                      alignment: Alignment.center,
                      height: 100,
                      width: 150,
                      fit: BoxFit.cover,
                    );
                  },
                  alignment: Alignment.center,
                  height: 100,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ).paddingForAll(4),
            )
          ],
        ).paddingForAll(10),
      ),
    );
  }
}
