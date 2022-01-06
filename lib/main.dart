import 'package:day1/CustomWidgets/custom.dart';
import 'package:day1/Screens/cartproducts.dart';
import 'package:day1/Screens/homepage.dart';
import 'package:day1/Screens/login.dart';
import 'package:day1/core/store.dart';
import 'package:day1/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: const MyApp()));
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
      initialRoute: MyRoute.HomeRoute,
      routes: {
        MyRoute.HomeRoute: (context) => const HomePage(),
        MyRoute.LoginRoute: (context) => const LoginScreen(),
        MyRoute.CartRoute: (context) => const CartProducts()
      },
    );
  }
}
