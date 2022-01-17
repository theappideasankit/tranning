import 'package:day1/Task2/pages/BottomNavPages/home_timeline.dart';
import 'package:day1/Task2/pages/BottomNavPages/search_page.dart';
import 'package:day1/Task2/pages/BottomNavPages/trainer_timeline.dart';
import 'package:flutter/material.dart';

import '../profileScreen.dart';
import 'massages_page.dart';
import 'notifications_page.dart';

class TabNavigatorRoutes {
  static const String root = "/";
  static const String details = "/details";
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final int tabItem;

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (tabItem == 1) {
      child = HomeTimeLine();
    } else if (tabItem == 2) {
      child = TrainerTimeLine();
    } else if (tabItem == 3) {
      child = SearchPage();
    } else if (tabItem == 4) {
      child = MassagePage();
    } else if (tabItem == 5) {
      child = ProfilePage();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
