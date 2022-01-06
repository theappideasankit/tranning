import 'package:day1/App1/Screens/login.dart';
import 'package:day1/App2/pages/homepage.dart';
import 'package:day1/Students/home_students.dart';
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
              child: "Shopping".text.make()),
          const Divider(),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage())),
              child: "Api Integration".text.make()),
          const Divider(),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeStudents())),
              child: "Api Students".text.make()),
        ],
      ).p32(),
    );
  }
}
