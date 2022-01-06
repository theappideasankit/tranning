import 'package:day1/App1/Screens/login.dart';
import 'package:day1/App2/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Tranning extends StatelessWidget {
  const Tranning({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen())),
              child: "App1".text.make()),
          const Divider(),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage())),
              child: "App2".text.make()),
        ],
      ).p32(),
    );
  }
}
