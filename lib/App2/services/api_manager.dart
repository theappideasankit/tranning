import 'dart:convert';

import 'package:day1/App2/constants.dart/constant.dart';
import 'package:day1/App2/model/newsModel.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class ApiManager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    // ignore: prefer_typing_uninitialized_variables
    var newsModel;

    try {
      var response = await client.get(Uri.parse(Strings.url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (e) {
      return newsModel;
    }

    return newsModel;
  }
}
