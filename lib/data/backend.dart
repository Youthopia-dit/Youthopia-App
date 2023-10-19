import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:youthopia/data/models/event_model.dart';
import 'package:youthopia/data/models/request_status.dart';
import 'package:youthopia/data/models/user_model.dart';

class Api {
  final String baseUrl = 'youthopiabackend.azurewebsites.net';
  // final String baseUrl = '192.168.1.16:3000';

<<<<<<< HEAD
  Future<void> login() async {

  }

  Future<void> signup() async {

  }

  Future<void> getEventDetails() async 
  {
    final Url = Uri.https(baseUrl, '/event/geteventdetails');
    final response = await http.get(Url);
    print(response.body);
=======
  Future<RequestStatus<UserDetails?>> login(
      {required String email, required String password}) async {
    final url = Uri.https(baseUrl, '/auth/login');
    final body = {'email': email, 'password': password};
    try {
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(body));
      final res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final token = res['token'];
        final UserDetails user = UserDetails.fromMap(res['user']);
        return RequestStatus(
            status: RequestStatus.SUCCESS, body: user, message: token);
      } else {
        return RequestStatus(
            status: RequestStatus.FAILURE, message: res['message']);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return RequestStatus(
          status: RequestStatus.FAILURE,
          message: 'Some Error Occured!. Please Try again Later!!');
    }
  }

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

    final url = Uri.https(baseUrl, '/auth/register');
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
      final response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({'data': body}));
      final res = jsonDecode(response.body);
      if (response.statusCode == 201) {
        final token = res['token'];
        final UserDetails user = UserDetails.fromMap(res['user']);
        return RequestStatus(
            status: RequestStatus.SUCCESS, body: user, message: token);
      } else {
        return RequestStatus(
            status: RequestStatus.FAILURE, message: res['message']);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      return RequestStatus(
          status: RequestStatus.FAILURE,
          message: 'Some Error Occured!. Please Try again Later!!');
    }
  }

  Future<RequestStatus<List<EventDetails>?>> getEventDetails() async {
    final url = Uri.https(baseUrl, '/event/geteventdetails');
    try {
      final response = await http.get(url);
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
>>>>>>> 089bc04764e16031e8e80e209e00f200850221af
  }
}
