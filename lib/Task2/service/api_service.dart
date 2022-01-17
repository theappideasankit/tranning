import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/login_model.dart';
import 'package:day1/Task2/model/user_model.dart';
import 'package:day1/Task2/model/view_profile.dart';
import 'package:http/http.dart' as http;



class APIServices {
  static var client = http.Client();
  static Future<UserResponseModel> registerUser(
    UserModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    print(model.toJson());
    var response = await client.post(
      Uri.parse(Constants.regUrl),
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return userResponseFromJson(response.body);
  }

  static Future<ViewProfileResponse> getProfile(
      Data model,
      ) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      '_token': 'naGR82kAHrw9INWVbAKvbPQLYUIAyaABPzRXnfYH',
    };
    var response = await client.get(
      Uri.parse(Constants.getProfile),
      headers: requestHeaders,
    );
    final profilejson = response.body;
    final decodedData = jsonDecode(profilejson);
   print(decodedData);
    return viewResponseFromJson(response.body);
  }

  static Future<LoginResponseModel> signInMethod(
      LoginRequestModel requestModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(Constants.urlLogin),
        body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400)  {
      Map<String, dynamic> output = json.decode(response.body);
      print(output['data']['result']['api_token']);
      pref.setString('api_token', output['data']['result']['api_token'] );
      Constants.apiToken = pref.getString('api_token');
      print(Constants.apiToken);
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      log("failed login");
      return loginResponseFromJson(response.body);
    }
  }

  Future get(String url) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = await pref.getString("token");
    var response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      log(response.body);

      return json.decode(response.body);
    }
    log(response.body);
    log(response.statusCode.toString());
  }

}
