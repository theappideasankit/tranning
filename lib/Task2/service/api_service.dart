import 'dart:convert';
import 'package:day1/Task2/constants.dart';
import 'package:day1/reg/model/user_model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static var client = http.Client();
 // static String apiURL = "http://192.168.0.103:8888/news-app";

  static Future<UserResponseModel> registerUser(
    UserModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      //'_token': Constants.tokenn
    };

    print(model.toJson());
    var response = await client.post(
      Uri.parse(Constants.baseurl),
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return userResponseFromJson(response.body);
  }
}
