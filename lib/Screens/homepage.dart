import 'package:day1/Screens/methods.dart';
import 'package:day1/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 4;
    String name = " Today I'm joining TheAppIdeas Company";
    double pi = 3.14;
    num temp = 50.5;
    var data = "hello how are you";
    studentsMethod();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "day1",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("i completed $days Months internship in flutter"),
          ),
          Text(name),
          Text("$pi"),
          Text("$temp"),
          Text(data)
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
