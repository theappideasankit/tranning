import 'package:day1/Task2/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/login_model.dart';
import 'model/user_model.dart';

class Constants{

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  static TextEditingController userNameController = TextEditingController();


  static final Key formKey = GlobalKey<FormState>();
  static bool isApiCalled = true;
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  static var fcmtoken;
  static var apiToken;


 // static var tokenLogin =  Constants.apiToken.setString("api_token", Constants.apiToken['data']['result']['api_token']);

  static String getProfile = "https://chessmafia.com/php/fitnow/FitNowApp/api/view-user-profile?_token=naGR82kAHrw9INWVbAKvbPQLYUIAyaABPzRXnfYH" + apiToken;
  static String urlLogin = "https://chessmafia.com/php/fitnow/FitNowApp/api/login?_token=naGR82kAHrw9INWVbAKvbPQLYUIAyaABPzRXnfYH";
  static String regUrl = "https://chessmafia.com/php/fitnow/FitNowApp/api/register?_token=naGR82kAHrw9INWVbAKvbPQLYUIAyaABPzRXnfYH";
  static bool isApiCallProcess = false;
  static UserModel userModel;
  static LoginRequestModel loginRequestModel;

  static SharedPreferences preferences;
  static APIServices apiServices = APIServices();

}