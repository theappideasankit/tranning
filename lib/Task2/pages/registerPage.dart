import 'dart:developer';

import 'package:day1/App1/Screens/homepage.dart';
import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/models/user_model.dart';
import 'package:day1/Task2/pages/loginScreen.dart';
import 'package:day1/Task2/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  UserModel userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = UserModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: Constants.emailController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter Email';
                }
                return null;
              },
              onSaved: (value) => Constants.email = value,
              decoration: const InputDecoration(
                  hintText: "Enter Email",
                  labelText: "Email",
                  border: OutlineInputBorder()),
            ),
            10.heightBox,
            TextFormField(
              controller: Constants.passController,
              onSaved: (value) => Constants.pass = value,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter Password';
                }
                return null;
              },
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
                  if (moveToLogin()) {
                    setState(() {
                      Constants.isApiCalled = true;
                    });
                    ApiServices apiServices = ApiServices();
                    apiServices
                        .login(userModel)
                        .then((UserModel userModel) {
                      setState(() {
                        Constants.isApiCalled = false;
                      });

                      if (userModel.code == 200) {
                        FormHelper.showSimpleAlertDialog(context,
                            "User Register", userModel.message, "ok", () {
                          Navigator.of(context).pop();
                        });
                      } else {
                        FormHelper.showSimpleAlertDialog(context,
                            "User Register", userModel.message, "ok", () {
                              Navigator.of(context).pop();
                        });
                      }

                 /*     if (userModel.data.email.isNotEmpty) {
                        final snackBar = SnackBar(
                            content: "email cant be empty".text.make());
                        Constants.scaffoldKey.currentState
                            .showSnackBar(snackBar);
                      } else {
                        final snackBar =
                            SnackBar(content: Text(userModel.message));
                        Constants.scaffoldKey.currentState
                            .showSnackBar(snackBar);
                      }*/
                    });
                  }
                },
                child: AnimatedContainer(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  duration: const Duration(seconds: 5),
                  child: "Register".text.xl2.make().centered(),
                ),
              ),
            )
          ],
        ).p16(),
      ),
    );
  }

  bool moveToLogin() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      //log(Constants.email);
/*
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
*/
      return true;
    } else {
      return false;
    }
  }
}
