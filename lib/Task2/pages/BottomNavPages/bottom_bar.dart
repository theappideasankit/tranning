import 'package:day1/Task2/pages/BottomNavPages/home_timeline.dart';
import 'package:day1/Task2/pages/BottomNavPages/notifications_page.dart';
import 'package:day1/Task2/pages/BottomNavPages/search_page.dart';
import 'package:day1/Task2/pages/BottomNavPages/tab_navigator.dart';
import 'package:day1/Task2/pages/BottomNavPages/trainer_timeline.dart';
import 'package:day1/Task2/pages/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'massages_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  int _currentPage = 1;

  // PageController pageController = PageController();
  List<int> pageKeys = [1, 2, 3, 4, 5];
  Map<int, GlobalKey<NavigatorState>> _navigatorKeys = {
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
    5: GlobalKey<NavigatorState>(),
  };

/*  void onTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
    pageController.jumpToPage(index);
  }*/
  void _selectTab(int tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != 1) {
            _selectTab(1, 1);
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
            _buildOffstageNavigator(4),
            _buildOffstageNavigator(5)
            /*       HomeTimeLine(),
            TrainerTimeLine(),
            NotificationPage(),
            MassagePage(),
            ProfilePage()*/
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.model_training_outlined), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            _selectTab(pageKeys[index], index);
          },
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(int tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
