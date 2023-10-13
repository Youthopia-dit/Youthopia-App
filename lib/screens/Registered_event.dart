import 'package:flutter/material.dart';

import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';

import '../widgets/event_container.dart';

class Registered_event extends StatefulWidget {
  const Registered_event({super.key});

  @override
  State<Registered_event> createState() => _Registered_eventState();
}

class _Registered_eventState extends State<Registered_event> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return BackgroundScaffold(
      appbar: YouthopiaAppbar(),
        child: ListView(physics: BouncingScrollPhysics(), children: [
      EventContainer(
        nameOfEvent: "name",
        time: "10:00am",
        venue: "hdfg",
      ),
      EventContainer(
        nameOfEvent: "name",
        time: "10:00am",
        venue: "hdfg",
      ),
      EventContainer(
        nameOfEvent: "name",
        time: "10:00am",
        venue: "hdfg",
      ),
      EventContainer(
        nameOfEvent: "name",
        time: "10:00am",
        venue: "hdfg",
      ),
          EventContainer(
            nameOfEvent: "name",
            time: "10:00am",
            venue: "hdfg",
          ),
      SizedBox(
        height: 50,
      )
    ]));
  }
}
