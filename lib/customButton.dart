import 'package:day1/blocpattern/logins.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'App1/CustomWidgets/custom.dart';

class CustomButtonW extends StatefulWidget {
  String text;
  final onTap;

  CustomButtonW({this.text, Key key, this.onTap}) : super(key: key);

  @override
  _CustomButtonWState createState() => _CustomButtonWState();
}

class _CustomButtonWState extends State<CustomButtonW> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blueGrey,
      shadowColor: Colors.black,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: widget.onTap,
        child: SizedBox(
          child: widget.text.text.bold.xl2
              .color(CustomWidget.creamColor)
              .make()
              .centered(),
          height: 50,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
