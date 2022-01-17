import 'dart:convert';

import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/searchusers_map_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchApi {
  Future<SearchUsersMap> searchUserMap() async {
    var viewMapUsers;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> header = {"_token": Constants.token};
      var map = Map<String, dynamic>();
      map["api_token"] = prefs.get("api_token");

      var response = await http.post(
          Uri.parse(Constants.baseUrl + "search-users"),
          headers: header,
          body: map);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        print(" View Map users response ===>" + jsonMap.toString());
        viewMapUsers = SearchUsersMap.fromJson(jsonMap);
      }
    } catch (e) {
      print("failed" + e);
    }
    return viewMapUsers;
  }
}
