import 'package:day1/App1/Screens/homepage.dart';
import 'package:day1/Task2/constants.dart';
import 'package:day1/Task2/model/user_model.dart';
import 'package:day1/Task2/pages/loginScreen.dart';
import 'package:day1/Task2/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Lottie.asset("assets/files/regg.json"))
                  .p20(),
              "Register".text.xl4.extraBold.make().p12(),
              const Divider(),
              10.heightBox,
              TextFormField(
                controller: Constants.emailController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Email';
                  }
                  return null;
                },
                onSaved: (onSavedVal) =>
                    {userModel.emailId = onSavedVal.toString().trim()},
                decoration: InputDecoration(
                    hintText: "Enter your email",
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              10.heightBox,
              TextFormField(
                controller: Constants.userNameController,
                onSaved: (onSavedVal) => {
                  userModel.userName = onSavedVal.toString().trim(),
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "enter your username",
                    labelText: "username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              10.heightBox,
              TextFormField(
                validator: (val) {
                  if (val.isEmpty) {
                    return "Enter your number";
                  } else
                    return null;
                },
                onSaved: (onSavedVal) => {
                  userModel.phoneNo = onSavedVal.toString().trim(),
                },
                decoration: InputDecoration(
                  labelText: "number",
                  hintText: "number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              10.heightBox,
              TextFormField(
                controller: Constants.passController,
                onSaved: (onSavedVal) =>
                    {userModel.password = onSavedVal.toString().trim()},
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "enter your Password",
                    labelText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
              10.heightBox,
              const Divider(),
              Material(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  splashColor: Colors.blue,
                  onTap: () {
                    if (moveToLogin()) {
                      setState(() {
                        Constants.isApiCallProcess = true;
                      });

                      APIServices.registerUser(userModel)
                          .then((UserResponseModel response) {
                        setState(() {
                          Constants.isApiCallProcess = false;
                        });
                        if (response.code == 200) {
                          FormHelper.showSimpleAlertDialog(
                            context,
                            "Fit Now Register",
                            response.message,
                            "Ok",
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            },
                          );
                        } else {
                          FormHelper.showSimpleAlertDialog(
                            context,
                            " Register Fail",
                            response.message,
                            "Ok",
                            () {
                              Navigator.of(context).pop();
                            },
                          );
                        }
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
              ),
              const Divider(),
              TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage() )),
                  child: "do you have an account\' Log In"
                      .text
                      .color(context.theme.accentColor)
                      .make())
            ],
          ).p24(),
        ),
      ),
    );
  }

  bool moveToLogin() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
