import 'package:flutter/material.dart';

class Constants{

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passController = TextEditingController();

  static String email,pass;
  static final Key formKey = GlobalKey<FormState>();
  static bool isApiCalled = true;
  static final scaffoldKey = GlobalKey<ScaffoldState>();

  static String urlLogin = "https://chessmafia.com/php/fitnow/FitNowApp/api/login";

  static String token = 'naGR82kAHrw9INWVbAKvbPQLYUIAyaABPzRXnfYH';




}