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

    return Scaffold(
      appBar: AppBar(
        title: const Text("day1"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("i completd $days Months internship in flutter"),
          ),
          Text(name),
          Text("$pi"),
          Text("$temp"),
          Text(data)
        ],
      ),
      drawer: const Drawer(),
    );
  }
}
