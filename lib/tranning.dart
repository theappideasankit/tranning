
import 'dart:io';

import 'package:day1/App1/CustomWidgets/custom.dart';
import 'package:day1/App1/Screens/login.dart';
import 'package:day1/App2/pages/homepage.dart';
import 'package:day1/Task2/pages/loginScreen.dart';
import 'package:day1/drawer.dart';
import 'package:day1/introduction.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:day1/recipeApp/home_recipe.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:lottie/lottie.dart';
import 'package:device_info/device_info.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class Tranning extends StatefulWidget {
  @override
  State<Tranning> createState() => _TranningState();
}

class _TranningState extends State<Tranning> {
  double prcentage = 0.0;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FirebaseMessaging.instance.getToken().then((fcmToken) {
    //   print("FCM TOKEN :");
    //   print(fcmToken);
    // });
    _deviceDetails();
  }

  String deviceName ='';
  String deviceVersion ='';
  String identifier= '';

  Future<void>_deviceDetails() async{
    final DeviceInfoPlugin deviceInfoPlugin =  DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        setState(() {
          deviceName = build.model;
          deviceVersion = build.version.toString();
          identifier = build.androidId;
          print(deviceName);
          print(deviceVersion);
          print(identifier);
        });
        //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        setState(() {
          deviceName = data.name;
          deviceVersion = data.systemVersion;
          identifier = data.identifierForVendor;
          print(deviceName);
          print(deviceVersion);
          print(identifier);
        });//UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

  }
  

  @override
  Widget build(BuildContext context) {
    final pr = ProgressDialog(context, type: ProgressDialogType.Download);
    pr.style(
        message: "Loading...",
        borderRadius: 10.0,
        backgroundColor: Colors.white10,
        elevation: 10.0,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 13.0,
        ),
        messageTextStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontSize: 19.0,
        ),
        progressWidget: Container(
          padding: const EdgeInsets.all(8.0),
          child: Lottie.asset("assets/files/transparent.json"),
        ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Training Tasks".text.make(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
              shadowColor: Colors.black,
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen())),
                child: SizedBox(
                  child: "Shopping"
                      .text
                      .bold
                      .xl2
                      .color(CustomWidget.creamColor)
                      .make()
                      .centered(),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            const Divider(),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
              shadowColor: Colors.black,
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage())),
                child: SizedBox(
                  child: "News API"
                      .text
                      .bold
                      .xl2
                      .color(CustomWidget.creamColor)
                      .make()
                      .centered(),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            const Divider(),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
              shadowColor: Colors.black,
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Homerecipe())),
                child: SizedBox(
                  child: "Food Recipe API"
                      .text
                      .bold
                      .xl2
                      .color(CustomWidget.creamColor)
                      .make()
                      .centered(),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            const Divider(),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
              shadowColor: Colors.black,
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () async {
                  await pr.show();
                  await Future.delayed(const Duration(seconds: 2));
                  prcentage = 30.0;
                  pr.update(progress: prcentage, message: "Please wait..");
                  await Future.delayed(const Duration(seconds: 2));
                  prcentage = 60.0;
                  pr.update(progress: prcentage, message: "almost there..");
                  await Future.delayed(const Duration(seconds: 3));
                  prcentage = 95.0;
                  pr.update(progress: prcentage, message: "Completing...");
                  await Future.delayed(const Duration(seconds: 1));
                  pr.hide();
                },
                child: SizedBox(
                  child: "Download"
                      .text
                      .bold
                      .xl2
                      .color(CustomWidget.creamColor)
                      .make()
                      .centered(),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            const Divider(),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
              shadowColor: Colors.black,
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IntroductionPage())),
                child: SizedBox(
                  child: "Intoduction Screen"
                      .text
                      .bold
                      .xl2
                      .color(CustomWidget.creamColor)
                      .make()
                      .centered(),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            const Divider(),
            Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
              shadowColor: Colors.black,
              child: InkWell(
                splashColor: Colors.blue,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  LoginPage())),
                child: SizedBox(
                  child: "All API"
                      .text
                      .bold
                      .xl2
                      .color(CustomWidget.creamColor)
                      .make()
                      .centered(),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            const Divider(),
            SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Lottie.asset("assets/files/learn.json"))
          ],
        ).p32(),
      ),
      drawer: const MainDrawer(),
      // bottomNavigationBar: Lottie.asset("assets/files/learn.json"),
    );
  }
}
