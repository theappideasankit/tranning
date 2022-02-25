import 'package:day1/App1/utils/routes.dart';
import 'package:day1/blocpattern/bloc/login_bloc.dart';
import 'package:day1/blocpattern/registers.dart';
import 'package:day1/blocpattern/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Logins extends StatefulWidget {
  const Logins({Key key}) : super(key: key);

  @override
  _LoginsState createState() => _LoginsState();
}

class _LoginsState extends State<Logins> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(context) async {
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
    final bloc = Provider.of<LoginBloc>(context, listen: false);

    return Material(
      color: context.canvasColor,
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome $name",
                style: mainHeadline,
              ),
              15.heightBox,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    StreamBuilder<String>(
                        stream: bloc.loginEmail,
                        builder: (context, snapshot) {
                          return TextFormField(
                            onChanged: bloc.changeLoginEmail,
                            /*{
                            name = value;
                            setState(() {});
                          },*/

                            //    validator: bloc.changeLoginEmail,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Enter Your Email",
                              errorText: snapshot.error,
                              border: const OutlineInputBorder(),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder<String>(
                        stream: bloc.loginPass,
                        builder: (context, snapshot) {
                          return TextFormField(
                            obscureText: true,
                            onChanged: bloc.changeLoginPass,
                            // validator: bloc.changeLoginPass,
                            decoration: InputDecoration(
                              labelText: "password",
                              errorText: snapshot.error,
                              hintText: "Enter Your Password",
                              border: const OutlineInputBorder(),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder<Object>(
                        stream: bloc.isValid,
                        builder: (context, snapshot) {
                          return Material(
                            color: Colors.blueGrey,
                            borderRadius:
                                BorderRadius.circular(changeButton ? 20 : 10),
                            child: InkWell(
                              splashColor: Colors.blue,
                              onTap: snapshot.hasError || !snapshot.hasData
                                  ? null
                                  : () {
                                      bloc.submit();
                                    },
                              child: AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  height: 50,
                                  width: changeButton ? 50 : 150,
                                  alignment: Alignment.center,
                                  child: snapshot.hasError || !snapshot.hasData
                                      ? const Text(
                                          "Login",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )
                                      : const Icon(Icons.done)),
                            ),
                          );
                        }),
                    20.heightBox,
                    GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Registers())),
                        child: "Register".text.semiBold.xl.center.make())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
