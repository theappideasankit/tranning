import 'package:day1/App1/utils/routes.dart';
import 'package:day1/Task2/constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
                "Login".text.xl4.extraBold.make().centered(),15.heightBox,
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
                    onTap: () => moveToHome(context),
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
      )
    );
  }
}
