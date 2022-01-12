import 'dart:convert';
import 'dart:io';
import 'package:day1/Task2/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final HttpClient httpClient = HttpClient();
  final String fcmUrl = 'https://fcm.googleapis.com/fcm/send';
  final fcmKey = "";

/*  void sendFcm(String title, String body, String fromToken) async {
    var headers = {
      'content-type': 'application/json',
      'Authorization': 'key=$fcmKey'
    };
    var request = http.Request('POST', Uri.parse(fcmUrl));
    request.body =
        '''{"to":"$fcmKey","priority":"high","notification":{"title":"$title","body":"$body","sound": "default"}}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }*/

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
