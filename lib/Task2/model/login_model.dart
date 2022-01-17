import 'dart:convert';
import 'dart:io';

import 'package:day1/Task2/constants.dart';
LoginResponseModel loginResponseFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginRequestModel {
  String email;
  String password;
  String token;


  LoginRequestModel({
    this.email,
    this.password,
    this.token
  });

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {

    Map<String, dynamic> map = {
    'username': email.trim(),
    'password': password.trim(),
    'fcm_token': Constants.fcmtoken.toString(),
    'device_type'
        : Platform.isAndroid ? "android" : "ios",
  };
    return
    map;
  }
}

class LoginResponseModel {
  int code;
  String message;

  LoginResponseModel({this.code, this.message});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
