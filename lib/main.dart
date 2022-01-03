import 'package:day1/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme()
      ),
      themeMode: ThemeMode.dark,
      // darkTheme: ThemeData(brightness: Brightness.light),
      //  home: const HomePage(),
      initialRoute: "/",
      routes: {
        "/": (context) => const LoginScreen(),
        "/login": (context) => const LoginScreen()
      },
    );
  }
}
