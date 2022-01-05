import 'package:day1/CustomWidgets/custom.dart';
import 'package:day1/Screens/cartproducts.dart';
import 'package:day1/Screens/homepage.dart';
import 'package:day1/Screens/login.dart';
import 'package:day1/utils/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: CustomWidget.lightTheme(context),
      darkTheme: CustomWidget.darkTheme(context),
      initialRoute: MyRoute.LoginRoute,
      routes: {
        MyRoute.HomeRoute: (context) => const HomePage(),
        MyRoute.LoginRoute: (context) => const LoginScreen(),
        MyRoute.CartRoute: (context) => const CartProducts()
      },
    );
  }
}
