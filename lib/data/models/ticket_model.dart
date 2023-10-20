import 'package:youthopia/data/models/event_model.dart';

import '../data_instance.dart';

class TicketDetails {
  final String userId;
  final EventDetails event;
  final String teamName;
  final List<String> teamMembers;
  final String eventId;
  final String ticketId;
  final String phone;

  TicketDetails(
      {required this.userId,
      required this.teamName,
      required this.teamMembers,
      required this.eventId,
      required this.ticketId,
        required this.event,
      required this.phone});

  factory TicketDetails.fromMap(Map<String, dynamic> map) {
    List<String> team = [];
    for (String mem in map['team_members']) {
      team.add(mem);
    }
    return TicketDetails(
        userId: map['user_id'],
        teamName: map['team_name'],
        teamMembers: team,
        eventId: map['event_id'],
        event: Data.eventList.singleWhere((element) => element.eventId == map['event_id']),
        ticketId: map['event_order_id'],
        phone: map['phone']);
  }
}
