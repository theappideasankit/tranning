import 'dart:convert';

UserResponseModel userResponseFromJson(String str) =>
    UserResponseModel.fromJson(json.decode(str));

class UserModel {
  String userName;
  String emailId;
  String phoneNo;
  String password;

  String confirmPassword;

  UserModel({
    this.userName,
    this.emailId,
    this.phoneNo,
    this.password,
    this.confirmPassword,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    emailId = json['email'];
    phoneNo = json['phone_no'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.userName;
    data['email'] = this.emailId;
    data['phone_no'] = this.phoneNo;
    data['password'] = this.password;
    return data;
  }
}

class UserResponseModel {
  int code;
  String message;

  UserResponseModel({this.code, this.message});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}


