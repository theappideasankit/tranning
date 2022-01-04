import 'package:day1/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/welcome.png",
                fit: BoxFit.cover,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Email cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: "Email",
                        hintText: "Enter Your Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Passsword length atleast 6";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "password",
                        hintText: "Enter Your Password",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Material(
                      color: Colors.blueGrey,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 20 : 10),
                      child: InkWell(
                        splashColor: Colors.blue,
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          height: 50,
                          width: changeButton ? 50 : 150,
                          alignment: Alignment.center,
                          child: changeButton
                              ? const Icon(Icons.done)
                              : const Text(
                                  "Login",
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
