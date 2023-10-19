import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:youthopia/data/models/base_response.dart';
import 'package:youthopia/data/models/event_model.dart';
import 'package:youthopia/data/models/request_status.dart';
import 'package:youthopia/data/models/user_model.dart';

class Api {
  final String baseUrl = 'youthopiabackend.azurewebsites.net';
  // final String baseUrl = '192.168.1.16:3000';

  Future<void> login() async {}

  Future<String> uploadImage(File? image) async {
    String imageUrl = '';
    if (image != null) {
      final fileName = basename(image.path);
      const des = 'identityDocuments';
      final ref = FirebaseStorage.instance.ref(des).child(fileName);
      TaskSnapshot uploadTask = await ref.putFile(image);
      imageUrl = await uploadTask.ref.getDownloadURL();
    }
    return imageUrl;
  }

  Future<RequestStatus<UserDetails?>> signup(
      {required String name,
      required String email,
      required String password,
      required String phone,
      required String college,
      required String year,
      required String id,
      File? image}) async {
    String imageUrl = await uploadImage(image);

    final Url = Uri.https(baseUrl, '/auth/register');
    final body = {
      'firstName': name,
      'lastName': '',
      'email': email,
      'phonenumber': phone,
      'password': password,
      'college': college,
      'year': year,
      'identityNumber': id,
      'photo': imageUrl
    };
    // print(body);
    try {
      final response = await http.post(Url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'data': body}));
      print(response.statusCode);
      print(response.body);
      final res = jsonDecode(response.body);
      if (response.statusCode == 201) {
        final token = res['token'];
        final UserDetails user = UserDetails.fromMap(res['user']);
        return RequestStatus(
            status: RequestStatus.SUCCESS,
            body: user,
            message: token);
      } else {
        return RequestStatus(
            status: RequestStatus.FAILURE,
            message: res['message']);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return RequestStatus(
          status: RequestStatus.FAILURE,
          message: 'Some Error Occured!. Please Try again Later!!');
    }
  }

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
    } on Exception catch (e) {
      debugPrint(e.toString());
      return RequestStatus(
          status: RequestStatus.FAILURE,
          message: 'Some Error Occured!. Please Try again Later!!');
    }
  }
}
