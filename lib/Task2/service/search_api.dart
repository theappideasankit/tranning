import 'dart:convert';

import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/searchusers_map_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchApi {
  Future<SearchUsersMap> searchUserMap() async {
    SearchUsersMap viewMapUsers;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var map = new Map<String, dynamic>();
      map['api_token'] = prefs.get('api_token');
      map['search'] = '';
      var response = await http.post(
          Uri.parse(Constants.baseUrl + "search-users"),
          body: map);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var decodeData = json.decode(jsonString);
        print("get all map response");
           print(decodeData);
        viewMapUsers = SearchUsersMap.fromJson(decodeData);
      }
    } catch (e) {
      return viewMapUsers;
    }
    return viewMapUsers;
  }
}
