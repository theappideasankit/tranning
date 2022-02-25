import 'package:day1/blocpattern/libs/chap-3/presentation/screens/BlocHome.dart';
import 'package:day1/blocpattern/libs/chap-3/presentation/screens/secondHome.dart';
import 'package:day1/blocpattern/libs/chap-3/presentation/screens/thirdHome.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    final GlobalKey<ScaffoldState> key = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => BlocHome());
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondHome(
                  color: Colors.redAccent,
                ));
        break;
      case '/third':
        return MaterialPageRoute(builder: (_) => ThirdHome());
        break;
      default:
        return null;
    }
  }
}
