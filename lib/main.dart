import 'package:day1/App1/CustomWidgets/custom.dart';
import 'package:day1/App1/Screens/login.dart';
import 'package:day1/App1/core/store.dart';
import 'package:day1/App1/utils/routes.dart';
import 'package:day1/introduction.dart';
import 'package:day1/splashscreen.dart';
import 'package:day1/tranning.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'App1/Screens/cartproducts.dart';
import 'App1/Screens/homepage.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
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
      initialRoute: MyRoute.Splash,
      routes: {
        MyRoute.HomeRoute: (context) => const HomePage(),
        MyRoute.LoginRoute: (context) => const LoginScreen(),
        MyRoute.CartRoute: (context) => const CartProducts(),
        MyRoute.TranningApps: (context) =>  Tranning(),
        MyRoute.Splash: (context) => const SplashScreen(),
        MyRoute.IntroScrenn: (context) => IntroductionPage()
      },
    );
  }
}
