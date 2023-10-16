import 'package:flutter/material.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';

class EventInfo extends StatefulWidget {
  const EventInfo(
      {super.key,
      required this.time,
      required this.date,
      required this.venue,
      required this.fee});
  final String time;
  final String date;
  final String venue;

  final String fee;

  @override
  State<EventInfo> createState() => _EventInfoState();
}

class _EventInfoState extends State<EventInfo> {
  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: Column(children: [
        Container(
          width: 337,
          height: 176,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(21),
          ),
        ).paddingForOnly(top: 100),
        Row(
          children: [
            Text("Event info",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ))
          ],
        ).paddingForOnly(
          left: 50,
          top: 15,
        ),
        Row(
          children: [
            Icon(
              Icons.watch_later_outlined,
              size: 15,
              color: Colors.white,
            ).paddingForOnly(left: 50, top: 15, right: 5),
            Text(widget.time,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                )).paddingForOnly(top: 15),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.calendar_month,
              size: 15,
              color: Colors.white,
            ).paddingForOnly(left: 50, top: 15, right: 5),
            Text("0 Nov 23",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                )).paddingForOnly(top: 15),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.location_on_rounded,
              size: 15,
              color: Colors.white,
            ).paddingForOnly(left: 50, top: 15, right: 5),
            Text("Venue",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                )).paddingForOnly(top: 15),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.money,
              size: 15,
              color: Colors.white,
            ).paddingForOnly(left: 50, top: 15, right: 5),
            Text("₹10",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                )).paddingForOnly(top: 15),
          ],
        ),
        Row(children: [
          Text("Discription",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              )),
        ]).paddingForOnly(left: 50, top: 15, right: 5),
        Row(children: [
          Text("This is the discription of the event",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ))
        ]).paddingForOnly(left: 50, top: 10, right: 5),
        SizedBox(
          width: 300.0,
          height: 40.0,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Registen now events',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Icon(
                Icons.arrow_right_alt_sharp,
                color: Colors.black,
              )
            ]),
          ),
        ).paddingForOnly(top: 20),
      ]),
    );
  }
}
