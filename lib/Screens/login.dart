import 'package:day1/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginScreen"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/2022.png",
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
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      name = value;
                      setState(() {});
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
                    decoration: const InputDecoration(
                      labelText: "password",
                      hintText: "Enter Your Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(()  {
                        changeButton = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                       Navigator.pushNamed(context, MyRoute.HomeRoute);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 50,
                      width: changeButton ? 50 : 150,
                      alignment: Alignment.center,
                      child: changeButton ? const Icon(Icons.done) : const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                           shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                          //borderRadius: BorderRadius.circular(changeButton ? 10 : 0),
                          ),
                    ),
                  ),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, MyRoute.HomeRoute);
                  //       //  print("you clicked login button");
                  //     },
                  //     child: const Text("Login"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
