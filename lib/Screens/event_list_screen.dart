import 'package:flutter/material.dart';
import 'package:youthopia/data/models/event_model.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_container.dart';
import 'package:youthopia/widgets/youthopia_appbar.dart';
import 'package:youthopia/widgets/youthopia_search_bar.dart';
import '../widgets/empty_events.dart';
import '../widgets/event_container.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key, this.type, required this.eventList});
  final String? type;
  final List<EventDetails> eventList;
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
              itemCount: widget.eventList.length,
              itemBuilder: (context, index) {
                print(index);
                // if (index == 0) {
                //   if (widget.type == "my") {
                //     return const YouthopiaAppbar();
                //   }
                //   return const YouthopiaSearchBar();
                // }
                if (widget.eventList.isEmpty) {
                  return const EmptyEventScreen();
                }
                print(widget.eventList[index].eventName);
                // if (index >= widget.eventList.length) {
                //   return const SizedBox(
                //     height: 20,
                //   );
                // } else {

                  return EventContainer(
                    key: GlobalKey(),
                    event: widget.eventList[index],
                  ).paddingWithSymmetry(horizontal: 20, vertical: 2);
                // }
              })),
    );
  }
}
