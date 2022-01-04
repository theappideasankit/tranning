import 'package:day1/CustomWidgets/custom.dart';
import 'package:day1/Screens/homepage.dart';
import 'package:day1/Screens/login.dart';
import 'package:day1/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomWidget.lightTheme(
        context,
      ),
      initialRoute: MyRoute.HomeRoute,
      routes: {
        MyRoute.HomeRoute: (context) => const HomePage(),
        MyRoute.LoginRoute: (context) => const LoginScreen()
      },
    );
  }
}
