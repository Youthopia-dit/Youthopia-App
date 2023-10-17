import 'package:flutter/material.dart';

import 'package:youthopia/utils/colors.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_container.dart';
import 'package:youthopia/widgets/background_scaffold.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';
import 'package:youthopia/widgets/youthopia_search_bar.dart';

import '../widgets/event_container.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key, this.type});
  final String? type;
  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BackgroundContainer(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 8,
              itemBuilder: (context, index) {
                if (index == 0) {
                  if (widget.type == "my") {
                    return const YouthopiaAppbar();
                  }
                  return const YouthopiaSearchBar();
                }
                if(index == 7) {
                  return const SizedBox(
                    height: 20,
                  );
                }
                return const EventContainer(
                  nameOfEvent: "Name of event",
                  time: "10:00am",
                  venue: "hdfg",
                ).paddingWithSymmetry(horizontal: 20, vertical: 2);
              })),
    );
  }
}
