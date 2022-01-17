import 'package:day1/App1/Screens/homepage.dart';
import 'package:day1/App1/utils/routes.dart';
import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/login_model.dart';
import 'package:day1/Task2/pages/profileScreen.dart';
import 'package:day1/Task2/service/api_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    loginRequestModel = LoginRequestModel();
    FirebaseMessaging.instance.getToken().then((fcmToken) {
      print("FCM TOKEN :");
      print(fcmToken);
      Constants.fcmtoken = fcmToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Constants.scaffoldKey,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Lottie.asset("assets/files/login.json"))
                    .p20(),
                "Login".text.xl4.extraBold.make().p12(),
                const Divider(),
                TextFormField(
                  onSaved: (input) => loginRequestModel.email = input,
                  validator: (input) =>
                      !input.contains('@') ? "Email Id should be valid" : null,
                  decoration: const InputDecoration(
                      hintText: "Enter Email",
                      labelText: "Email",
                      border: OutlineInputBorder()),
                ),
                10.heightBox,
                TextFormField(
                  onSaved: (input) => loginRequestModel.password = input,
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
                    onTap: () {
                      if (validateAndSave()) {
                        setState(() {
                          Constants.isApiCallProcess = true;
                        });
                        APIServices.signInMethod(loginRequestModel)
                            .then((LoginResponseModel response) {
                          if (response != null) {
                            setState(() {
                              Constants.isApiCallProcess = false;
                            });
                            if (response.code == 200) {

                              FormHelper.showSimpleAlertDialog(
                                context,
                                "FitNow Login success",
                                response.message,
                                "Ok",
                                    () {
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const ProfilePage()));
                                },
                              );
                            } else {
                              FormHelper.showSimpleAlertDialog(
                                context,
                                " Login Fail",
                                response.message,
                                "Ok",
                                    () {
                                  Navigator.of(context).pop();
                                },
                              );
                            }
                          /*  if (value.message.isNotEmpty) {
                             *//* FormHelper.showSimpleAlertDialog(
                                context,
                                " Login Success",
                                loginRequestModel.email,
                                "Ok",
                                () {
                                  Navigator.of(context).pop();
                                },
                              );*//*

                              final snackBar = SnackBar(
                                  content: "Login Successful"
                                      .text
                                      .color(Colors.black)
                                      .make());
                              Constants.scaffoldKey.currentState
                                  .showSnackBar(snackBar);
                            } else {
                              final snackBar =
                                  SnackBar(content: value.message.text.color(Colors.black).make());
                              Constants.scaffoldKey.currentState
                                  .showSnackBar(snackBar);
                            }*/
                          }
                        });
                      }
                    },
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
        ));
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
