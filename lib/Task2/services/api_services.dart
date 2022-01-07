import 'dart:convert';
import 'package:day1/Task2/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<UserModel> login(UserModel userModel) async {
    String url = "https://chessmafia.com/php/fitnow/FitNowApp/api/register";
    final response = await http.post(Uri.parse(url), body: userModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(response);
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Fail Register data");
    }
  }
}
