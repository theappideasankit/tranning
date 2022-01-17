import 'package:day1/Task2/pages/BottomNavPages/home_timeline.dart';
import 'package:day1/Task2/pages/BottomNavPages/notifications_page.dart';
import 'package:day1/Task2/pages/BottomNavPages/search_page.dart';
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
  int _selectedPage = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          HomeTimeLine(),
          SearchPage(),
          NotificationPage(),
          MassagePage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
      ),
    );
  }
}
