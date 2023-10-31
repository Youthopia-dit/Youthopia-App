import 'package:youthopia/data/models/event_model.dart';

import '../data_instance.dart';

class HomeDetails {
  final List<String> sponsorImages;
  final List<String> coverImages;
  final List<EventDetails> featuredEvents;

  HomeDetails(
      {required this.sponsorImages,
      required this.coverImages,
      required this.featuredEvents});

  factory HomeDetails.fromMap(Map<String, dynamic> map) {
    List<String> sponsors = [];
    List<String> cover = [];
    List<EventDetails> events = [];
    for (String sp in map['sponser_img']) {
      sponsors.add(sp);
    }

    for (String cv in map['carousel_img']) {
      cover.add(cv);
    }
    for (String id in map['featured_event']) {
      events.add(
          Data.eventList.singleWhere((element) => (element.eventId == id)));
    }

    return HomeDetails(
        sponsorImages: sponsors, coverImages: cover, featuredEvents: events);
  }
}
