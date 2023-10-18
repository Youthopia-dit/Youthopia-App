import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:youthopia/data/models/event_model.dart';
import 'package:youthopia/data/models/request_status.dart';

class Api {
  final String baseUrl = 'youthopiabackend.azurewebsites.net';

  Future<void> login() async {}

  Future<void> signup() async {}

  Future<RequestStatus<List<EventDetails>?>> getEventDetails() async {
    final Url = Uri.https(baseUrl, '/event/geteventdetails');
    try {
      final response = await http.get(Url);
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        List<EventDetails> eventList = [];
        for (Map<String, dynamic> element in res['details']) {
          eventList.add(EventDetails.fromMap(element));
        }
        return RequestStatus(status: RequestStatus.SUCCESS, body: eventList);
      } else {
        return RequestStatus(
            status: RequestStatus.FAILURE,
            message: 'Some Error Occured!. Please Try again Later!!');
      }
    } on Exception catch(e) {
      debugPrint(e.toString());
      return RequestStatus(
          status: RequestStatus.FAILURE,
          message: 'Some Error Occured!. Please Try again Later!!');
    }
  }
}
