import 'dart:convert';

import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/get_trainee_list_model.dart';
import 'package:day1/Task2/model/get_followers_model.dart';
import 'package:day1/Task2/model/get_following_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GetFollowFollowing {
  Future<GetFollowersModel> getFollowersApi(int i, String value) async {
    var followersApi;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> header = {"_token": Constants.token};
      var map = new Map<String, dynamic>();
      map['api_token'] = prefs.get('api_token');
      map['user_id'] = i.toString();
      map['search'] = value.toString();
      var response = await http.post(
          Uri.parse(Constants.baseUrl + 'get-followers'),
          headers: header,
          body: map);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var decodeData = json.decode(jsonString);
        print(" View Followers response ===>" + decodeData.toString());
        followersApi = GetFollowersModel.fromJson(decodeData);
      }
    } catch (e) {
      print("failed get followers" + e);
      return followersApi;
    }
    return followersApi;
  }

  Future<GetFollowingModel> getFollowingApi(int i, String value) async {
    var followingApi;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> header = {"_token": Constants.token};
      var map = new Map<String, dynamic>();
      map['api_token'] = prefs.get('api_token');
      map['user_id'] = i.toString();
      map['search'] = value.toString();
      var response = await http.post(
          Uri.parse(Constants.baseUrl + 'get-following'),
          headers: header,
          body: map);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var decodeData = json.decode(jsonString);
        print(" View following response ===>" + decodeData.toString());
        followingApi = GetFollowingModel.fromJson(decodeData);
      }
    } catch (e) {
      print("failed get following" + e);
      return followingApi;
    }
    return followingApi;
  }

  Future<GetTraineeListModel> getTraineeApi(int i, String value) async {
    var traineeApi;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> header = {"_token": Constants.token};
      var map = new Map<String, dynamic>();
      map['api_token'] = prefs.get('api_token');
      map['user_id'] = i.toString();
      map['search'] = value.toString();
      var response = await http.post(
          Uri.parse(Constants.baseUrl + 'trainee-list'),
          headers: header,
          body: map);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var decodeData = json.decode(jsonString);
        print(" View following response ===>" + decodeData.toString());
        traineeApi = GetTraineeListModel.fromJson(decodeData);
      }
    } catch (e) {
      print("failed get following" + e);
      return traineeApi;
    }
    return traineeApi;
  }





}
