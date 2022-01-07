import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// ignore: use_key_in_widget_constructors
class LoggerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    logger.v("verbose log");
    logger.d("debug log");
    logger.i("info log");
    logger.w("warning log");
    logger.e("eror log");
    logger.wtf("what a terrible failure log");
    return  Scaffold(
      appBar: AppBar(
          title: const Text("data"),
      ),
    );
  }
}
