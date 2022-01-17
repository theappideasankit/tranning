import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController allUsersSearchController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

/*
Padding(
padding: const EdgeInsets.only(top: 30),
child: Column(
children: [
Container(
width: size.width - 30,
height: 30,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(10),
color: const Color(0xFF262626),
),
child: TextFormField(
controller: allUsersSearchController,
onChanged: (followersValue) {
*/
/*   controller.getFollowersApi(widget.id, followersValue).then((value) {
                    setState(() {});
                  });*/ /*

},
decoration: InputDecoration(
hintText: "Search",
border: InputBorder.none,
prefixIcon: Padding(
padding:
const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0),
child: FaIcon(
Icons.search,
color: Colors.white.withOpacity(0.3),
),
),
),
style: TextStyle(color: Colors.white.withOpacity(0.40)),
cursorColor: Colors.white.withOpacity(0.3),
),
).p12(),
],
),
),*/
