import 'dart:convert';
import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/get_all_post.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetAllPostApi {
  static Future<GetAllPost> getAllPost() async {
    var viewPost;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> header = {"_token": Constants.token};
      var map = new Map<String, dynamic>();
      map['api_token'] = prefs.get('api_token');
      var response = await http.post(
          Uri.parse(Constants.baseUrl + "get-all-post"),
          headers: header,
          body: map);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var decodeData = json.decode(jsonString);
        print("get all post response");
        print(decodeData);
        viewPost = GetAllPost.fromJson(decodeData);
      }
    } catch (e) {
      return viewPost;
    }
    return viewPost;
  }
}
