import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  final urlProfile =
      "https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(urlProfile),
                ),
                margin: EdgeInsets.zero,
                accountName: const Text(
                  "Ankit Mistry",
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: const Text(
                  "theappideas.ankit@gmail.com",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.adb_outlined,
                color: Colors.white,
              ),
              title: Text(
                "About",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.feedback_outlined,
                color: Colors.white,
              ),
              title: Text(
                "Feedback",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
