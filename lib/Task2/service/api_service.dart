import 'dart:convert';
import 'dart:developer';
import 'package:day1/Task2/model/view_all_trainer_profile_model.dart';
import 'package:day1/Task2/model/update_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/login_model.dart';
import 'package:day1/Task2/model/register_model.dart';
import 'package:day1/Task2/model/view_my_profile_model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static var client = http.Client();

  //Data data;
  static Future<UserResponseModel> registerUser(
    UserModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };
    var response = await client.post(
      Uri.parse(Constants.regUrl),
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    return userResponseFromJson(response.body);
  }

  Future<UpdateProfileResponse> updateUserProfile(
    UpdateUserProfileModel model,
    String path,
  ) async {
    UpdateProfileResponse updateUserModel;
    try {
      Map<String, String> header = {"_token": Constants.token};
      var map = Map<String, String>();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      map["api_token"] = prefs.get("api_token");
      map["email"] = model.email;
      map["username"] = model.username;
      map["phone_no"] = model.phoneNo;
      map["bio"] = model.bio;
      // map["is_private"] = model.isPrivate;
      var request = http.MultipartRequest(
          'POST', Uri.parse(Constants.baseUrl + "update-profile"))
        ..headers.addAll(header)
        ..fields.addAll(map);
      if (path != null) {
        request.files.add(await http.MultipartFile.fromPath('profile', path));
      } else {
        request.fields['profile'] = "";
      }
      request.send().then((response) async {
        var jsonString = await response.stream.bytesToString();
        var jsonMap = json.decode(jsonString);
        print(jsonMap);
        if (jsonMap["status"].toString() == "Success") {
          print("profile updated =======>" + response.statusCode.toString());
          updateUserModel = UpdateProfileResponse.fromJson(jsonMap);
        } else {
          print(
              "Profile updated failed =====>" + response.statusCode.toString());
        }
      });
    } catch (e) {
      print("error's" + e.toString());
      return updateUserModel;
    }
    return updateUserModel;
  }

  static Future<LoginResponseModel> signInMethod(
      LoginRequestModel requestModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final response = await http.post(Uri.parse(Constants.urlLogin),
        body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      Map<String, dynamic> output = json.decode(response.body);
      // print(output['data']['result']['api_token']);
      print(output['data']['result']['id']);
      pref.setString('api_token', output['data']['result']['api_token']);
      pref.setInt('user_id', output['data']['result']['id']);
      //  var userResponse = LoginResponseModel.fromJson(output);

      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      log("failed login");
      return loginResponseFromJson(response.body);
    }
  }

  Future<ViewProfileResponse> getUserProfile() async {
    ViewProfileResponse viewModel;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> header = {"_token": Constants.token};
      var map = new Map<String, dynamic>();
      map["api_token"] = prefs.get("api_token");
      var response = await client.post(
          Uri.parse(Constants.baseUrl + "view-my-profile"),
          headers: header,
          body: map);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        // print(" View Profile response ===>" + jsonMap.toString());
        viewModel = ViewProfileResponse.fromJson(jsonMap);
      }
    } catch (e) {
      return viewModel;
    }
    return viewModel;
  }


}
