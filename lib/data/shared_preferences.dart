import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:youthopia/data/backend.dart';
import 'package:youthopia/data/models/base_response.dart';
import 'package:youthopia/data/models/ticket_model.dart';
import 'package:youthopia/data/models/user_model.dart';

import 'data_instance.dart';
import 'models/request_status.dart';

class Auth {
  Future<RequestStatus<UserDetails?>> signup(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String college,
      required String year,
      required String identity,
      File? image}) async {
    Api api = Api();
    final response = await api.signup(
        name: name,
        email: email,
        password: password,
        phone: phone,
        college: college,
        year: year,
        id: identity);
    if (response.status == RequestStatus.SUCCESS) {
      String token = response.message!;

      saveToken(token);
      return RequestStatus(
          status: RequestStatus.SUCCESS,
          body: response.body,
          message: 'Signup Success');
    } else {
      return response;
    }
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    print(token);
    if (token != null) {
      Data.token = token;
    }
    return token;
  }

  Future<RequestStatus<UserDetails?>> login({required String email, required String password}) async {
    Api api = Api();
    print('auth');
    final response = await api.login(email: email, password: password);

    if (response.status == RequestStatus.SUCCESS) {
      String token = response.message!;

      saveToken(token);
      return RequestStatus(
          status: RequestStatus.SUCCESS,
          body: response.body,
          message: 'Login Success');
    } else {
      return response;
    }
  }

  Future<RequestStatus<UserDetails?>> getUserDetails() async {
    String? token = await getToken();
    Api api = Api();
    final response = await api.getUserDetails(token: token!);
    return response;
  }

  void saveToken(String token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', token);
  }

  Future<void> logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('token');
  }

  Future<RequestStatus<BaseResponse?>> registerEvent({required String name, required List<String> members, required String phone, required String eventId}) async {
    Api api = Api();
    String? token = await getToken();
    print('token');
    final response = await api.registerEvent(token: token!, name: name, members: members, phone: phone, eventId: eventId);
    return response;
  }

  Future<RequestStatus<List<TicketDetails>?>> getRegisteredEvents() async {
    String? token = await getToken();
    Api api = Api();
    print('token');
    final response = await api.getRegisteredEvents(token: token!);
    return response;

  }
}
