import 'package:flutter/material.dart';
import 'package:youthopia/data/models/event_model.dart';
import 'package:youthopia/utils/widget_extensions.dart';
import 'package:youthopia/widgets/background_container.dart';
import '../utils/colors.dart';
import '../widgets/empty_events.dart';
import '../widgets/event_container.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key, required this.eventList});
  final List<EventDetails> eventList;
  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  bool isSearchActive = false;
  List<EventDetails> currentList = [];
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    currentList = widget.eventList;
    super.initState();
  }

  Widget searchInactive() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'Assets/youthopia_logo.png',
          width: 200,
        ).paddingForOnly(left: 20),
        IconButton(
            onPressed: () {
              setState(() {
                isSearchActive = true;
              });
            },
            icon: const Icon(
              Icons.search,
              color: CustomColors.white,
              size: 32,
            )).paddingForOnly(right: 20)
      ],
    );
  }

  Widget searchActive() {
    return TextField(
      controller: controller,
      style: const TextStyle(color: CustomColors.white),
      onChanged: (value) {
        if (value == '') {
          currentList = widget.eventList;
        } else {
          // for(EventDetails event in widget.eventList) {
          //   if(event.eventName.toUpperCase().contains(value.toUpperCase())) {
          //     currentList.add(event);
          //   }
          // }
          currentList = widget.eventList
              .where((element) =>
                  element.eventName.toUpperCase().contains(value.toUpperCase()))
              .toList();
        }
        setState(() {});
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 25),
          isDense: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  const BorderSide(color: CustomColors.white, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:
                  const BorderSide(color: CustomColors.white, width: 2)),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isSearchActive = false;
              });
            },
            icon: const Icon(
              Icons.search,
              color: CustomColors.white,
              size: 32,
            ),
          )),
    ).paddingForOnly(left: 20, right: 20, bottom: 20);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BackgroundContainer(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: currentList.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return (isSearchActive) ? searchActive() : searchInactive();
                }
                if (currentList.isEmpty) {
                  return const EmptyEventScreen();
                }
                if (index >= currentList.length) {
                  return const SizedBox(
                    height: 20,
                  );
                }
                return EventContainer(
                  event: currentList[index - 1],
                ).paddingWithSymmetry(horizontal: 20, vertical: 2);
              })),
    );
  }
}
