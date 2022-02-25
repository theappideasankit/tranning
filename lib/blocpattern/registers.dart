import 'package:day1/App1/utils/routes.dart';
import 'package:day1/blocpattern/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/velocity_x.dart';

class Registers extends StatefulWidget {
  const Registers({Key key}) : super(key: key);

  @override
  _RegistersState createState() => _RegistersState();
}

class _RegistersState extends State<Registers> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  bool isVisible = true;

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
    final bloc = Provider.of<RegisterBloc>(context, listen: false);

    return Material(
      color: context.canvasColor,
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Register $name",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              15.heightBox,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    StreamBuilder<String>(
                        stream: bloc.regEmail,
                        builder: (context, snapshot) {
                          return TextFormField(
                            onChanged: bloc.changeRegEmail,
                            /*{
                            name = value;
                            setState(() {});
                          },*/

                            decoration:  InputDecoration(
                              labelText: "Email",
                              hintText: "Enter Your Email",
                              errorText: snapshot.error,
                              border: OutlineInputBorder(),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder<String>(
                        stream: bloc.regPass,
                        builder: (context, snapshot) {
                          return TextFormField(
                            obscureText: isVisible,
                            onChanged: bloc.changeRegPass,
                            decoration:  InputDecoration(
                              labelText: "password",
                              suffixIcon: IconButton(
                                  icon: isVisible ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              onPressed:() {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                              },
                              ),
                              errorText: snapshot.error,
                              hintText: "Enter Your Password",
                              border: OutlineInputBorder(),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                      color: Colors.blueGrey,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 20 : 10),
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () {

                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: 50,
                          width: changeButton ? 50 : 150,
                          alignment: Alignment.center,
                          child: changeButton
                              ? const Icon(Icons.done)
                              : const Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                        ),
                      ),
                    ),
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
