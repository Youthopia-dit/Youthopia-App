class EventDetails {
  final List<Coordinators> coordinators;
  final List<Coordinators> overallHead;
  final List<String> rules;
  final int participantMin;
  final int participantMax;
  final String eventName;
  final String description;
  final String poster;
  final String feesdit;
  final String feesnondit;
  final String venue;
  final String date;
  final String startTime;
  final String endTime;
  final List<String> bots;
  final String clubName;
  final String category;
  final String eventId;

  EventDetails(
      {required this.coordinators,
      required this.eventId,
      required this.eventName,
      required this.description,
      required this.poster,
      required this.feesdit,
      required this.feesnondit,
      required this.venue,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.rules,
      required this.bots,
      required this.clubName,
      required this.overallHead,
      required this.participantMax,
      required this.participantMin,
      required this.category});

  factory EventDetails.fromMap(Map<String, dynamic> map) {
    List<Coordinators> coord = [];
    List<Coordinators> heads = [];
    map['coordinator']
        .forEach((k, v) => coord.add(Coordinators(phone: v, name: k)));
    map['overall_head']
        .forEach((k, v) => heads.add(Coordinators(phone: v, name: k)));
    List<String> rules = [];
    List<String> bots = [];

    for (String r in map['rules']) {
      rules.add(r);
    }

    for (String b in map['bots']) {
      bots.add(b);
    }
    return EventDetails(
      coordinators: coord,
      overallHead: heads,
      rules: rules,
      eventName: map['event_name'],
      description: map['event_description'],
      poster: map['event_poster'],
      feesdit: map['fees1'].toString() ?? '',
      feesnondit: map['fees2'].toString() ?? '',
      venue: map['venue'],
      date: map['date'],
      startTime: map['start_time'],
      endTime: map['end_time'],
      bots: bots,
      participantMin: map['participant_min'] ,
      participantMax: map['participant_max'] ,
      eventId: map['event_id'],
      clubName: map['club_name'],
      category: map['category'],
    );
  }
}

class Coordinators {
  final String name;
  final String phone;

  Coordinators({required this.phone, required this.name});
}
