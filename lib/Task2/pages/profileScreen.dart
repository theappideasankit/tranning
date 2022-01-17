import 'dart:convert';
import 'dart:developer';

import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/view_profile.dart';
import 'package:day1/Task2/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Data data;
  bool circular = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //  APIServices.getProfile(data);
    //Constants.preferences.getString('api_token') ;
    // data.apiToken = Constants.preferences.getString("api_token");
    fetchData();
    // log(data.apiToken);
    // Constants.apiToken;
  }

  void fetchData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var response = await Constants.apiServices.get(Constants.getProfile);
    setState(() {
      data = Data.fromJson(response["data"]);
      print(Constants.apiToken);
    });
  }

/*  loaddata() async {
    if (validateAndSave()) {
      setState(() {
        Constants.isApiCallProcess = true;
      });
      APIServices.getProfile(loginRequestModel)
          .then((LoginResponseModel response) {
        if (response != null) {
          setState(() {
            Constants.isApiCallProcess = false;
          });

        }
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          head(),
          Divider(
            thickness: 0.8,
          ),
          otherDetails("bio", data.bio),
          otherDetails("username", data.username),
          otherDetails("phone_no", data.phoneNo),
          otherDetails("email", data.email),
          Divider(
            thickness: 0.8,
          ),
        ],
      ),
    );
  }

  Widget head() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              radius: 50,
              //backgroundImage: NetworkHandler().getImage(profileModel.username),
            ),
          ),
          Text(
            data.username,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(data.bio)
        ],
      ),
    );
  }

  Widget otherDetails(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$label :",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            value,
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
