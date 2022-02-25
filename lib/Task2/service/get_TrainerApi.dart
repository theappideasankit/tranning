import 'dart:convert';
import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/get_all_trainer_model.dart';
import 'package:day1/Task2/model/view_all_trainer_profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetAllTrainerApi {
  var viewPost;
  LikeInfo likeInfo = LikeInfo();

  Future<GetAllTrainerFeed> getAllTainer() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> header = {"_token": Constants.token};
      var map = new Map<String, dynamic>();
      map['api_token'] = prefs.get('api_token');
      var response = await http.post(
          Uri.parse(Constants.baseUrl + "get-all-trainer-post"),
          headers: header,
          body: map);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var decodeData = json.decode(jsonString);
        print("get all video response");
     //   print(decodeData);
        viewPost = GetAllTrainerFeed.fromJson(decodeData);
      }
    } catch (e) {
      return viewPost;
    }
    return viewPost;
  }

  Future<GetTrainerProfile> getTrainerProfile(int i) async {
    var viewTrainerModel;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> header = {"_token": Constants.token};
      var map = new Map<String, dynamic>();
      map["api_token"] = prefs.get("api_token");
      map["user_id"] = i.toString();
      var response = await http.post(
          Uri.parse(Constants.baseUrl + "view-trainer-profile"),
          headers: header,
          body: map);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        print(" View Trainer Profile response ===>" + jsonMap.toString());
        viewTrainerModel = GetTrainerProfile.fromJson(jsonMap);
      }
    } catch (e) {
      return viewTrainerModel;
    }
    return viewTrainerModel;
  }

  Future<void> likePost(int i) async {
    Map<String, String> header = {"_token": Constants.token};
    var map = <String, dynamic>{};
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    map["api_token"] = prefs.get('api_token');
    map["post_id"] = viewPost.data[i].id.toString();
    //print("id ----> "+viewPost.data[i].id.toString());
    likeInfo.postId = int.parse(viewPost.data[i].id.toString());
    likeInfo.userId = int.parse(viewPost.data[i].userId.toString());
    //viewPost.data[i].likeInfo.add(likeInfo);
    // print("likeinfo ---->" +viewPost.data[i].likeInfo.toString());
    final response = await http.post(Uri.parse(Constants.baseUrl + "like-post"),
        body: map, headers: header);
    final jsonResponse = json.decode(response.body);
    if (jsonResponse["status"].toString() != "Error") {
      print("like success" + jsonResponse.toString());
      if (jsonResponse["data"].toString() == "like") {
        viewPost.data[i].likeInfo.add(likeInfo);
      } else {
        for (int ii = 0; ii < viewPost.data[i].likeInfo.length; ii++) {
          if (Constants.uid == viewPost.data[i].likeInfo[ii].userId) {
            viewPost.data[i].likeInfo.removeAt(ii);
            break;
          }
        }
      }
    } else {
      print("failed");
    }
  }

  isLikedOrNot(int i) {
    bool isLikeSaved = false;

    for (int i2 = 0; i2 < viewPost.data[i].likeInfo.length; i2++) {
      if (Constants.uid.toString() ==
          viewPost.data[i].likeInfo[i2].userId.toString()) {
        isLikeSaved = true;
        break;
      } else {
        isLikeSaved = false;
      }
    }
    if (isLikeSaved == true) {
      return true;
    } else {
      return false;
    }
  }
}
