class UserDetails {
  final List<String> registeredEvents;
  final String userId;
  final String username;
  final String email;
  final String phonenumber;
  final String college;
  final String year;
  final String participantIdentity;
  final String participantIdentityNumber;
  UserDetails(
      {required this.userId,
      required this.username,
      required this.email,
      required this.phonenumber,
      required this.college,
      required this.year,
      required this.registeredEvents,
      required this.participantIdentity,
      required this.participantIdentityNumber});

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    List<String> reg = [];
    for (String event in map['registered_events']) {
      reg.add(event);
    }
    return UserDetails(
        userId: map['_id'],
        username: map['firstname'] + map['lastname'],
        email: map['email'],
        phonenumber: map['phonenumber'].toString(),
        college: map['college'],
        year: map['year'],
        registeredEvents: reg,
        participantIdentity: map['participant_identity'],
        participantIdentityNumber: map['participant_identity_number']);
  }
}
