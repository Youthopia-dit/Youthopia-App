import 'package:flutter/material.dart';
import 'package:youthopia/Screens/form_screen.dart';
import 'package:youthopia/data/models/event_model.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';

class SingleEventScreen extends StatefulWidget {
  const SingleEventScreen({super.key, required this.eventDetails});
  final EventDetails eventDetails;

  @override
  State<SingleEventScreen> createState() => _SingleEventScreenState();
}

class _SingleEventScreenState extends State<SingleEventScreen> {
  @override
  Widget build(BuildContext context) {
    // print(widget.eventDetails.description);
    print(widget.eventDetails.rules[0]);
    return BackgroundScaffold(
      child: ListView(physics: BouncingScrollPhysics(), children: [
        YouthopiaAppbar(),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            widget.eventDetails.poster,
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
            height: 200,
            width: 350,
            fit: BoxFit.cover,
          ),
        ).paddingForOnly(top: 20, bottom: 20, left: 30, right: 30),
        Row(
          children: [
            Text(widget.eventDetails.eventName,
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
            Text(
                "${widget.eventDetails.startTime} - ${widget.eventDetails.endTime}",
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
            Text(widget.eventDetails.date,
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
            Text(widget.eventDetails.venue,
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
            Text("${widget.eventDetails.feesdit} for DIT students",
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
            Text("${widget.eventDetails.feesnondit} for non-DIT students",
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
          SizedBox(
            width: 300,
            child: Text(widget.eventDetails.description,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
          )
        ]).paddingForOnly(left: 50, top: 10, right: 5, bottom: 10),
        Row(children: [
          Text("Rules",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              )),
        ]).paddingForOnly(left: 50, top: 15, right: 5),
        ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: widget.eventDetails.rules.length,
            itemBuilder: (context, index) {
              return Text(widget.eventDetails.rules[index],
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )).paddingForOnly(left: 40, right: 40);
            }),
        widget.eventDetails.bots.isEmpty
            ? SizedBox()
            : Row(children: [
                Text("Bots ",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    )),
              ]).paddingForOnly(left: 50, top: 15, right: 5),
        ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: widget.eventDetails.bots.length,
            itemBuilder: (context, index) {
              return Text(widget.eventDetails.bots[index],
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )).paddingForOnly(left: 40, right: 40);
            }),
        SizedBox(
          width: 300.0,
          height: 40.0,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => FormScreen()),
                  (route) => false);
            },
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
      ]).paddingForOnly(top: 10, bottom: 40),
    );
  }
}
