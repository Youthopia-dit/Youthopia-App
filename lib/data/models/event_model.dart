class Event {
  final Map<String, String> coordinators;
  final Map<String, String> overallHead;
  final List<String> rules;
  final String eventName,
      description,
      poster,
      feesdit,
      feesnondit,
      venue,
      date,
      startTime,
      endTime,
      bots,
      clubName,
      category,
      participantMax,
      eventId;

  Event(
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
      required this.category});
}
