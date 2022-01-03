import 'package:day1/Screens/homepage.dart';
import 'package:day1/Screens/login.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      themeMode: ThemeMode.dark,
      // darkTheme: ThemeData(brightness: Brightness.light),
      //  home: const HomePage(),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/login": (context) => const LoginScreen()
      },
    );
  }
}
