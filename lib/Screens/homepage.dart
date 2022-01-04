import 'package:day1/Screens/methods.dart';
import 'package:day1/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int days = 4;
    // String name = " Today I'm joining TheAppIdeas Company";
    // double pi = 3.14;
    // num temp = 50.5;
    // var data = "hello how are you";
    studentsMethod();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "day1",
        ),
      ),
      body: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
                maxHeight: 200, maxWidth: 210, minHeight: 10, minWidth: 20),
            child: Container(
              height: 500,
              width: 500,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
