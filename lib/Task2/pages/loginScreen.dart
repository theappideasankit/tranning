import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:day1/App1/Screens/homepage.dart';
import 'package:day1/App1/utils/routes.dart';
import 'package:day1/Task2/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool changeButton = true;

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoute.HomeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              "Login".text.xl4.extraBold.make().centered(),
              15.heightBox,
              TextField(
                controller: Constants.emailController,
                decoration: const InputDecoration(
                    hintText: "Enter Email",
                    labelText: "Email",
                    border: OutlineInputBorder()),
              ),
              10.heightBox,
              TextField(
                controller: Constants.passController,
                decoration: const InputDecoration(
                    hintText: "enter your Password",
                    labelText: "password",
                    border: OutlineInputBorder()),
              ),
              10.heightBox,
              Material(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  splashColor: Colors.blue,
                  onTap: () => signInMethod(Constants.emailController.text,
                      Constants.passController.text),
                  child: AnimatedContainer(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    duration: const Duration(seconds: 5),
                    child: "Login".text.xl2.make().centered(),
                  ),
                ),
              )
            ],
          ).p16(),
        ).p16(),
      ],
    ));
  }
  String pass = '123456789';
  String email = 'akki10@gmail.com';

  signInMethod(String email, String pass) async {
    var fcmtoken;
    FirebaseMessaging.instance.getToken().then((fcmToken) {
      fcmToken = fcmtoken;
    });
/*
    Map<String, String> header = {"_token": Constants.token};

    var map = Map<String, dynamic>();
*/

/*
    final response =
    await http.post(Uri.parse(Constants.urlLogin), body: map, headers: header);

    map["email"] = email;
    map["password"] = pass;
    map['fcm_token'] = fcmtoken.value;
    map['device_type'] = Platform.isAndroid ? "android" : "ios";

    //var url = "/login";
*/

    http.post(Uri.parse(Constants.urlLogin), headers: {
      'Accept': 'application/json',
      'authorization': 'pass your key(optional)'
    }, body: {
      "email": email,
      "password": pass
    }).then((response) {
      print(response.statusCode);
      var responseJson = json.decode(response.body);
      print(responseJson);
    }
        //print(map["email"]);

        // var responseJson = null;

/*    var response = await http.post(Uri.parse(Constants.urlLogin), body: {
      "_token": Constants.token,
      "email": "kushal"
      "password": "1111111"
    });*/

        /* if (response.statusCode == 200) {
      responseJson = json.decode(response.body);
      if (responseJson != null) {
        print(responseJson['_token']);
        print(responseJson['message']);
        print(responseJson);
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            ));
      }
    } else {
      String err = "email or password wrong!!!!";
      log(err);
      print("email or password wrong!!!!");
    }*/
        );
  }
}
