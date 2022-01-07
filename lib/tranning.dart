import 'package:day1/App1/CustomWidgets/custom.dart';
import 'package:day1/App1/Screens/login.dart';
import 'package:day1/App2/pages/homepage.dart';
import 'package:day1/Task2/pages/loginScreen.dart';
import 'package:day1/Task2/pages/registerPage.dart';
import 'package:day1/drawer.dart';
import 'package:day1/introduction.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:day1/recipeApp/home_recipe.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class Tranning extends StatelessWidget {
  double prcentage = 0.0;

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
        title: "Tranning Tasks".text.make(),
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
                        builder: (context) => const RegisterPage())),
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
