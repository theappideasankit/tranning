import 'package:day1/Task2/model/comment_post_model.dart';
import 'package:day1/Task2/model/view_my_profile_model.dart';
import 'package:day1/Task2/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/login_model.dart';
import 'model/update_profile_model.dart';
import 'model/register_model.dart';

class Constants{

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  static TextEditingController userNameController = TextEditingController();


  static final Key formKey = GlobalKey<FormState>();
  static bool isApiCalled = true;
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  static var fcmtoken;
  static String apiToken;


 // static var tokenLogin =  Constants.apiToken.setString("api_token", Constants.apiToken['data']['result']['api_token']);

  static String getProfile = "https://chessmafia.com/php/fitnow/FitNowApp/api/view-my-profile?_token=naGR82kAHrw9INWVbAKvbPQLYUIAyaABPzRXnfYH&api_token=$apiToken&=";
  static String urlLogin = "https://chessmafia.com/php/fitnow/FitNowApp/api/login?_token=naGR82kAHrw9INWVbAKvbPQLYUIAyaABPzRXnfYH";
  static String regUrl = "https://chessmafia.com/php/fitnow/FitNowApp/api/register?_token=naGR82kAHrw9INWVbAKvbPQLYUIAyaABPzRXnfYH";
  static String baseUrl = "https://chessmafia.com/php/fitnow/FitNowApp/api/";
  static String token = "?_token=naGR82kAHrw9INWVbAKvbPQLYUIAyaABPzRXnfYH";
  static String urlImage = "https://chessmafia.com/php/fitnow/FitNowApp/";
 static bool isToggled = false;
  static bool isChangedButton = false;

  static bool isApiCallProcess = false;
  static UserModel userModel;
  static LoginRequestModel loginRequestModel;
  static UpdateUserProfileModel updateUserProfileModel;
  static CommentPost commentPost = CommentPost();
  static String searchController;

  static Future<ViewProfileResponse> viewModel ;

  static SharedPreferences preferences;
  static APIServices apiServices = APIServices();
  static int uid;

  static Color backgroundColor = Colors.black45;

  static isLoggedInPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiToken = prefs.getString('api_token');
    uid = prefs.getInt('user_id');
    print(apiToken);
    print(uid);
  }
}