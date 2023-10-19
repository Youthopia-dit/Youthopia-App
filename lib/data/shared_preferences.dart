import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:youthopia/data/backend.dart';
import 'package:youthopia/data/models/user_model.dart';

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
    }
    else {
      return response;
    }
  }

  void saveToken(String token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', token);
  }
}
