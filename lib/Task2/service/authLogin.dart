import 'package:day1/Task2/pages/BottomNavPages/bottom_bar.dart';
import 'package:day1/Task2/pages/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLogin extends StatefulWidget {
  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  var isLoggedIn;

  isLoggedInPref(String apiToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiToken = prefs.getString('api_token');
    setState(() {
       isLoggedIn = apiToken ;
    });
    return isLoggedInPref;
   // print(isLoggedIn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoggedInPref(isLoggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn == null ? LoginPage() : BottomBar();
  }
}
