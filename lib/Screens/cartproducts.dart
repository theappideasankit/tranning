import 'package:day1/CustomWidgets/custom.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomWidget.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Container(),
    );
  }
}
